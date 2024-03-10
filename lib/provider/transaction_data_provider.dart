// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'models/transaction_model.dart';

class TransactionDataProvider with ChangeNotifier {
  final List<Transaction> _myTransactionsList = [
    Transaction(
        "test id",
        0,
        "My Transaction My Transaction My Transaction",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt tortor eu ante aliquet condimentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Mauris vel ex sed magna suscipit tempus. Fusce vel mauris nunc. Nunc auctor leo vitae velit molestie, non posuere justo volutpat. Integer at tellus ac elit efficitur sollicitudin. Ut accumsan tincidunt ante, eu dictum eros molestie sed. Cras congue orci nec quam vehicula, nec lacinia odio vestibulum. Suspendisse potenti. Curabitur tincidunt sem eu odio accumsan, quis ullamcorper libero blandit. Duis id libero sed odio consequat dictum.",
        1200,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("test id2", 1, "My Transaction", "My Description", 800,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        2,
        "My Transaction",
        "My Description",
        -1000,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        3,
        "My Transaction",
        "My Description",
        200,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        4,
        "My Transaction",
        "My Description",
        500,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        5,
        "My Transaction",
        "My Description",
        -600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        6,
        "My Transaction",
        "My Description",
        1200,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        7,
        "My Transaction",
        "My Description",
        300,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        8,
        "My Transaction",
        "My Description",
        -1600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        9,
        "My Transaction",
        "My Description",
        -800,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        10,
        "My Transaction",
        "My Description",
        600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction(
        const Uuid().v4().toString(),
        11,
        "My Transaction",
        "My Description",
        -200,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
  ];

  List<Transaction> get fullList => _myTransactionsList;

  List<Transaction>? get incomeList =>
      _myTransactionsList.where((element) => element.amount >= 0).toList();

  List<Transaction>? get expenseList =>
      _myTransactionsList.where((element) => element.amount < 0).toList();

  num CurrentBalance() {
    num sum = 0;
    for (int i = 0; i < _myTransactionsList.length; i++) {
      sum = sum + _myTransactionsList[i].amount;
    }
    return sum;
  }

  num TotalIncome() {
    num sum = 0;
    for (int i = 0; i < _myTransactionsList.length; i++) {
      if (_myTransactionsList[i].amount >= 0) {
        sum = sum + _myTransactionsList[i].amount;
      }
    }
    return sum;
  }

  num TotalExpense() {
    num sum = 0;
    for (int i = 0; i < _myTransactionsList.length; i++) {
      if (_myTransactionsList[i].amount < 0) {
        sum = sum + _myTransactionsList[i].amount;
      }
    }
    return sum * -1;
  }

  void DeleteTransaction(String id) {
    _myTransactionsList.removeWhere((element) => element.id == id);
    CurrentBalance();
    TotalExpense();
    TotalIncome();
    notifyListeners();
  }

  void AddNewTransaction(
      {required String title,
      required String description,
      required num amount,
      required isIncome}) {
    if (isIncome == false) {
      _myTransactionsList.add(Transaction(Uuid().v4().toString(), 1, title,
          description, amount * -1, DateTime.now().toString()));
    } else {
      _myTransactionsList.add(Transaction(Uuid().v4().toString(), 1, title,
          description, amount, DateTime.now().toString()));
    }
    notifyListeners();
  }
}
