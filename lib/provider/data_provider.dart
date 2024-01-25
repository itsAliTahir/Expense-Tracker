import 'package:cash_book_expense_tracker/provider/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionDataProvider with ChangeNotifier {
  final List<Transaction> _myExpensesList = [
    Transaction("1", "My Transaction", "My Description", 1200, "not made yet"),
    Transaction("2", "My Transaction", "My Description", 800, "not made yet"),
    Transaction("3", "My Transaction", "My Description", -1000, "not made yet"),
    Transaction("4", "My Transaction", "My Description", 200, "not made yet"),
    Transaction("5", "My Transaction", "My Description", -500, "not made yet"),
  ];

  List<Transaction> get allitems {
    return [..._myExpensesList];
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
