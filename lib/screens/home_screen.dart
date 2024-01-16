import 'package:expense_tracking_app/utils/theme_text.dart';
import 'package:expense_tracking_app/widgets/rectangular_card.dart';
import 'package:expense_tracking_app/widgets/select_calender.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../main.dart';
import '../models/income_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  late Box<IncomeModel> incomeBox;

  @override
  void initState() {
    controller = TabController(
      length: 4,
      vsync: this,
    );
    incomeBox = Hive.box<IncomeModel>("income");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF6E5),
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 32,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              child: Image(
                image: AssetImage('assets/images/notifiaction.png'),
              ),
            ),
          ),
        ],
        title: const SelectCalender(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: mq.height * .25,
            width: mq.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              color: Color(0xFFFFF6E5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  const Text(
                    'Account Balance',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    '₹ ' '38000',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RectangularCard(
                        backGroundColor: Color(0xFF00A86B),
                        cardIcon: 'assets/images/income.png',
                        cardTitle: 'Income',
                        cardAmount: '50000',
                      ),
                      RectangularCard(
                          backGroundColor: Color(0xFFFD3C4A),
                          cardIcon: 'assets/images/expense.png',
                          cardTitle: 'Expenses',
                          cardAmount: '12000')
                    ],
                  ),
                ],
              ),
            ),
          ),
          TabBar(
            controller: controller,
            tabs: const [
              Text("Today"),
              Text("Week"),
              Text("Month"),
              Text("Year"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recent Transaction",
                          style: ThemeText.kInter18Black,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffEEE5FF),
                          ),
                          child: const Text(
                            "See All",
                            style: TextStyle(color: Color(0xff7F3DFF)),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: incomeBox.length,
                      itemBuilder: (context, index) {
                        final model = incomeBox.getAt(index);

                        if (model != null) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade200,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: const Icon(Icons.ac_unit_rounded),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(model.category),
                                  Text(model.desc)
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(model.wallet),
                                  const Text("10:00 AM"),
                                ],
                              )
                            ],
                          );
                        } else {
                          return const Text("No Item Available.");
                        }
                      },
                    ))
                  ],
                ),
                Text("Today"),
                Text("Today"),
                Text("Today"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
