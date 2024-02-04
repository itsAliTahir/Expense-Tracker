// ignore_for_file: non_constant_identifier_names

import 'package:cash_book_expense_tracker/screens/income_expense_detail_screen/ie_graph.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_title.dart';
import '../../widgets/appbar.dart';
import 'ie_transactions_list.dart';

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
    double screenHeight = MediaQuery.of(context).size.height - 56;
    final List args = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(GoBack, args[1] as String)),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: const Border(bottom: BorderSide(color: Colors.grey))),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Center(child: args[0] as Widget),
                  SizedBox(height: screenHeight * 0.045),
                  MyIncomeExpenseGraph(args),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
            Flexible(
                flex: 5,
                child: MyIETransactionsList(screen: args[1] as String)),
          ],
        ),
      ),
    );
  }
}
