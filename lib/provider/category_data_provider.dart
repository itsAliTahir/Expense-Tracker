// ignore_for_file: non_constant_identifier_names

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'models/category_model.dart';
import 'models/transaction_model.dart';

class CategoryDataProvider with ChangeNotifier {
  final List<Categories> _allCategories = [
    Categories(0, AvailableCategories.Miscellaneous.toString().split('.').last,
        FluentIcons.puzzle_piece_24_filled),
    Categories(1, AvailableCategories.Housing.toString().split('.').last,
        FluentIcons.home_12_filled),
    Categories(2, AvailableCategories.Transportation.toString().split('.').last,
        FluentIcons.vehicle_bicycle_24_filled),
    Categories(3, AvailableCategories.Food.toString().split('.').last,
        FluentIcons.food_pizza_24_filled),
    Categories(4, AvailableCategories.Health.toString().split('.').last,
        FluentIcons.stethoscope_24_filled),
    Categories(5, AvailableCategories.Entertainment.toString().split('.').last,
        FluentIcons.games_24_filled),
    Categories(6, AvailableCategories.Utilities.toString().split('.').last,
        Icons.bolt),
    Categories(7, AvailableCategories.Shopping.toString().split('.').last,
        Icons.shopping_bag),
    Categories(8, AvailableCategories.Payment.toString().split('.').last,
        FluentIcons.payment_24_filled),
    Categories(9, AvailableCategories.Savings.toString().split('.').last,
        Icons.savings_sharp),
    Categories(10, AvailableCategories.Loan.toString().split('.').last,
        FluentIcons.money_hand_24_filled),
    Categories(11, AvailableCategories.Taxes.toString().split('.').last,
        Icons.money_off_csred),
  ];
  final List<int> _selectedCategoriesIndex = [];
  final List<Transaction> _itemsList = [];

  // Getters

  List<Transaction> get itemsList => _itemsList;

  List<int> get allSelectedCategories {
    return [..._selectedCategoriesIndex];
  }

  List<Categories> get allCategories {
    return [..._allCategories];
  }

  // Methods

  void Toggleselection(int index) {
    if (_selectedCategoriesIndex.contains(index)) {
      _selectedCategoriesIndex.removeWhere((element) => element == index);
    } else {
      _selectedCategoriesIndex.add(index);
    }
    _selectedCategoriesIndex.sort();
    notifyListeners();
    return;
  }

  void RemoveSelection(int index) {
    if (_selectedCategoriesIndex.contains(index)) {
      _selectedCategoriesIndex.removeWhere((element) => element == index);
    }
    _selectedCategoriesIndex.sort();
    notifyListeners();
    return;
  }

  void ResetCategories() {
    _selectedCategoriesIndex.clear();
    notifyListeners();
  }
}
