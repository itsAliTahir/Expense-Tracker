import 'package:cash_book_expense_tracker/provider/models/instance_model.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  final List<Expenses> _myExpensesList = [];

  List<Expenses> get items {
    return [..._myExpensesList];
  }
}
