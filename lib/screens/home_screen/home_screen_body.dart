import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'appbar.dart';
import 'current_balance.dart';
import 'floatingactionbutton.dart';
import 'income_expenses.dart';
import 'select_filter.dart';
import 'transactions_list.dart';

class MyHomeScreenBody extends StatelessWidget {
  MyHomeScreenBody({super.key});
  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      backdropColor: Colors.black,
      disabledGestures: true,
      openRatio: 0.75,
      drawer: Drawer(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: MyAppBar(_handleMenuButtonPressed, "CASH BOOK")),
        body: const Column(children: [
          MyCurrentBalance(),
          MyIncomeExpenses(),
          MySelectType(),
          MyTransactionsList(),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: const MyFloatingActionButton(),
      ),
    );
  }
}

// https://pub.dev/packages/flutter_advanced_drawer/example