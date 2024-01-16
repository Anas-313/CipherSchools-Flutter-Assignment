import 'package:hive/hive.dart';

part 'income_model.g.dart';

@HiveType(typeId: 0, adapterName: "incomeModelAdapter")
class IncomeModel extends HiveObject {
  @HiveField(0)
  final String desc;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String wallet;
  @HiveField(3)
  final double amount;

  IncomeModel(
      {required this.desc,
      required this.category,
      required this.amount,
      required this.wallet});
  //
  // IncomeModel.fromJson(Map<String, dynamic> json) {
  //   desc = json['desc'];
  //   category = json['category'];
  //   waller = json['waller'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['desc'] = desc;
  //   data['category'] = category;
  //   data['waller'] = waller;
  //   return data;
  // }
}
