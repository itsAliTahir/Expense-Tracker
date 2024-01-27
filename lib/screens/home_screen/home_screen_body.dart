import 'package:flutter/material.dart';
import 'appbar.dart';
import 'current_balance.dart';
import 'floatingactionbutton.dart';
import 'income_expenses.dart';
import 'select_filter.dart';
import 'transactions_list.dart';

class MyHomeScreenBody extends StatelessWidget {
  const MyHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: MyAppBar(),
      ),
      drawer: Drawer(),
      body: Column(children: [
        MyCurrentBalance(),
        MyIncomeExpenses(),
        MySelectType(),
        MyTransactionsList(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}
