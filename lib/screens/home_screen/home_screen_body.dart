import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import 'current_balance.dart';
import 'floatingactionbutton.dart';
import 'income_expenses.dart';
import 'select_filter.dart';
import 'transactions_list.dart';

class MyHomeScreenBody extends StatefulWidget {
  MyHomeScreenBody({super.key});

  @override
  State<MyHomeScreenBody> createState() => _MyHomeScreenBodyState();
}

class _MyHomeScreenBodyState extends State<MyHomeScreenBody> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void OpenDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(OpenDrawer, "CASH BOOK")),
      drawer: Drawer(),
      body: const Column(children: [
        MyCurrentBalance(),
        MyIncomeExpenses(),
        MySelectType(),
        MyTransactionsList(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

// https://pub.dev/packages/flutter_advanced_drawer/example