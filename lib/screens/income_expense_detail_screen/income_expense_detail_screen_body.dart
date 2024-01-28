import 'package:cash_book_expense_tracker/screens/home_screen/appbar.dart';
import 'package:cash_book_expense_tracker/screens/income_expense_detail_screen/graph.dart';
import 'package:flutter/material.dart';

class MyIncomeExpenseDetailScreenBody extends StatefulWidget {
  const MyIncomeExpenseDetailScreenBody({super.key});

  @override
  State<MyIncomeExpenseDetailScreenBody> createState() =>
      _MyIncomeExpenseDetailScreenBodyState();
}

class _MyIncomeExpenseDetailScreenBodyState
    extends State<MyIncomeExpenseDetailScreenBody> {
  void GoBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final List args = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(GoBack, args[1] as String)),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: args[0] as Widget,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "Total ${args[1] as String}",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            ),
            MyIncomeExpenseGraph(args),
          ],
        ),
      ),
    );
  }
}

//https://pub.dev/packages/fl_animated_linechart/example