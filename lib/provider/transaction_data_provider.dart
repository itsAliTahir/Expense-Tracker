import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction_model.dart';

class TransactionDataProvider with ChangeNotifier {
  final List<Transaction> _myExpensesList = [
    Transaction(
        "0",
        0,
        "My Transaction My Transaction My Transaction",
        "My Description",
        1200,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("1", 1, "My Transaction", "My Description", 800,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("2", 2, "My Transaction", "My Description", -1000,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("3", 3, "My Transaction", "My Description", 200,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("4", 4, "My Transaction", "My Description", -500,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("5", 5, "My Transaction", "My Description", 600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("6", 6, "My Transaction", "My Description", 600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("7", 7, "My Transaction", "My Description", 600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("8", 8, "My Transaction", "My Description", -1600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("9", 9, "My Transaction", "My Description", -800,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("10", 10, "My Transaction", "My Description", 600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
    Transaction("11", 11, "My Transaction", "My Description", 600,
        DateFormat("MMMM d, yyyy hh:mm a").format(DateTime.now())),
  ];

  List<Transaction> get fullList {
    return [..._myExpensesList];
  }

  List<Transaction> get incomeList {
    return [..._myExpensesList.where((element) => element.amount >= 0)];
  }

  List<Transaction> get expenseList {
    return [..._myExpensesList.where((element) => element.amount < 0)];
  }

  num CurrentBalance() {
    num sum = 0;
    for (int i = 0; i < _myExpensesList.length; i++) {
      sum = sum + _myExpensesList[i].amount;
    }
    return sum;
  }

  num TotalIncome() {
    num sum = 0;
    for (int i = 0; i < _myExpensesList.length; i++) {
      if (_myExpensesList[i].amount >= 0) {
        sum = sum + _myExpensesList[i].amount;
      }
    }
    return sum;
  }

  num TotalExpense() {
    num sum = 0;
    for (int i = 0; i < _myExpensesList.length; i++) {
      if (_myExpensesList[i].amount < 0) {
        sum = sum + _myExpensesList[i].amount;
      }
    }
    return sum * -1;
  }
}
