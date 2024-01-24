import 'package:cash_book_expense_tracker/provider/models/transaction_model.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  final List<Transaction> _myExpensesList = [
    Transaction("1", "My Transaction", 1200, "not made yet"),
    Transaction("2", "My Transaction", 800, "not made yet"),
    Transaction("3", "My Transaction", -1000, "not made yet"),
    Transaction("4", "My Transaction", 200, "not made yet"),
    Transaction("5", "My Transaction", -500, "not made yet"),
  ];

  List<Transaction> get items {
    return [..._myExpensesList];
  }
}
