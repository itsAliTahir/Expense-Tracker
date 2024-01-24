import 'package:cash_book_expense_tracker/screens/home_screen/appbar.dart';
import 'package:cash_book_expense_tracker/screens/home_screen/current_balance.dart';
import 'package:cash_book_expense_tracker/screens/home_screen/select_category.dart';
import 'package:flutter/material.dart';

class MyHomeScreenBody extends StatelessWidget {
  const MyHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: MyAppBar(),
      ),
      drawer: Drawer(),
      body: Column(children: [
        MyCurrentBalance(),
        MySelectCategory(),
      ]),
    );
  }
}
