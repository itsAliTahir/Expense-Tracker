import 'package:flutter/material.dart';

class CategoryDataProvider with ChangeNotifier {
  final List<int> _selectedCateforiesIndex = [];

  List<int> get allSelectedCategories {
    return [..._selectedCateforiesIndex];
  }
}
