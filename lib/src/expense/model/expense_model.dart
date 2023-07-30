// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExpenseModel {
  final int expenseId;
  final String itemName;
  final int itemQuantity;
  final double itemPrice;

  final String weekDayName;
  final DateTime dateTime;
  ExpenseModel({
    required this.expenseId,
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
    required this.weekDayName,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expenseId': expenseId,
      'itemName': itemName,
      'itemQuantity': itemQuantity,
      'itemPrice': itemPrice,
      'weekDayName': weekDayName,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      expenseId: map['expenseId'] as int,
      itemName: map['itemName'] as String,
      itemQuantity: map['itemQuantity'] as int,
      itemPrice: map['itemPrice'] as double,
      weekDayName: map['weekDayName'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
