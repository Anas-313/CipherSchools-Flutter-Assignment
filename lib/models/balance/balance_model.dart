import 'package:hive/hive.dart';

part 'balance_model.g.dart';

@HiveType(typeId: 1, adapterName: "BalanceModelAdapter")
class BalanceModel extends HiveObject {
  @HiveField(0)
  final double total;
  @HiveField(1)
  final double income;
  @HiveField(2)
  final double expense;

  BalanceModel(
      {required this.total, required this.income, required this.expense});
//
// BalanceModel.fromJson(Map<String, dynamic> json) {
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
