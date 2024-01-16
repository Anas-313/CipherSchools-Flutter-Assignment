import 'package:expense_tracking_app/models/balance/balance_model.dart';
import 'package:expense_tracking_app/models/income_model.dart';
import 'package:expense_tracking_app/utils/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../main.dart';
import '../../widgets/round_button.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final category = TextEditingController();
  final desc = TextEditingController();
  final wallet = TextEditingController();
  final money = TextEditingController();

  late Box<IncomeModel> incomeBox;

  @override
  void initState() {
    // TODO: implement initState

    incomeBox = Hive.box<IncomeModel>("income");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
          onPressed: null,
        ),
        backgroundColor: const Color(0xFF7B61FF),
        centerTitle: true,
        title: const Text(
          'Income',
          style: ThemeText.kInter18White,
        ),
      ),
      backgroundColor: const Color(0xFF7B61FF),
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: mq.height * .25),
                  const Text(
                    'How much ?',
                    style: ThemeText.kInter18White,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: mq.width * 0.6,
                    child: TextField(
                      controller: money,
                      keyboardType: TextInputType.number,
                      style: ThemeText.kInter64,
                      decoration: const InputDecoration(
                        prefixText: "₹",
                        hintText: "0",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: mq.height * .40,
            child: Container(
              height: mq.height * .60,
              width: mq.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: category,
                    ),
                    TextFormField(
                      controller: desc,
                    ),
                    TextFormField(
                      controller: wallet,
                    ),
                    SizedBox(
                      height: mq.height * 0.1,
                    ),
                    RoundButton(
                      onPressed: () {
                        final moneyValue = double.tryParse(money.text.trim());
                        incomeBox.add(
                          IncomeModel(
                            desc: desc.text.trim(),
                            category: category.text.trim(),
                            wallet: wallet.text.trim(),
                            amount: moneyValue ?? 0.0,
                          ),
                        );

                        final box = Hive.box<BalanceModel>("balance");

                        final previous = box.getAt(0);

                        if (previous != null) {
                          box.putAt(
                              0,
                              BalanceModel(
                                  total: previous.total + moneyValue!,
                                  income: previous.total - moneyValue,
                                  expense: previous.expense - moneyValue));
                        }

                        print(incomeBox.length);
                      },
                      btnName: 'Continue',
                      btnBackgroundColor: Color(0xFF7F3DFF),
                      btnTextColor: Color(0xFFFCFCFC),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
