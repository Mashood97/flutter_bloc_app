import 'dart:convert';
import 'dart:developer';

import 'package:bloc_article_app/src/expense/model/expense_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

class SecureStorage {
  static final SecureStorage _singleton = SecureStorage._internal();

  factory SecureStorage() {
    return _singleton;
  }

  SecureStorage._internal();

  final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

  final String _expenseKey = "expense_key";

  Future<void> writeDataOfExpenseInLocalDB(
      {required List<ExpenseModel> expenseModel}) async {
    try {
      await _storage.write(
        key: _expenseKey,
        value: jsonEncode(expenseModel),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<ExpenseModel>> readDataOfExpenseModelInLocalDB() async {
    var data = await _storage.read(key: _expenseKey);
    List decodedData = [];
    if (data != null) {
      decodedData = jsonDecode(data);
    }
    if (decodedData == []) {
      return [];
    }
    return decodedData.map((e) => ExpenseModel.fromJson(e)).toList();
  }
}
