// ignore_for_file: non_constant_identifier_names

import 'package:cash_book_expense_tracker/widgets/appbar.dart';
import 'package:cash_book_expense_tracker/screens/income_expense_detail_screen/ie_graph.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_title.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    final List args = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(GoBack, args[1] as String)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                child: args[0] as Widget,
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 30),
                child: CustomTitle(
                  title: "${args[1] as String} Report",
                  transition: true,
                ),
              ),
              MyIncomeExpenseGraph(args),
            ],
          ),
        ),
      ),
    );
  }
}
