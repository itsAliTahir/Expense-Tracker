// ignore_for_file: non_constant_identifier_names

import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/transaction_data_provider.dart';
import '../../widgets/gradient_box.dart';

class MyIncomeExpenses extends StatelessWidget {
  const MyIncomeExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TransactionDataProvider>(context).TotalIncome();
    Provider.of<TransactionDataProvider>(context).TotalExpense();
    final totalIncome =
        Provider.of<TransactionDataProvider>(context, listen: false)
            .totalIncome;
    final totalExpense =
        Provider.of<TransactionDataProvider>(context, listen: false)
            .totalExpense;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GradientBox(
            amount: totalIncome,
            title: "Income",
            gradient1: incomeDark,
            gradient2: incomeLight,
            openDetail: () {
              if (totalIncome != 0) {
                Navigator.pushNamed(context, routeIEScreen, arguments: [
                  GradientBox(
                      amount: totalIncome,
                      title: "Income",
                      gradient1: incomeDark,
                      gradient2: incomeLight,
                      openDetail: null),
                  "Income"
                ]);
              }
            }),
        GradientBox(
          amount: totalExpense,
          title: "Expense",
          gradient1: expenseDark,
          gradient2: expenseLight,
          openDetail: () {
            if (totalExpense != 0) {
              Navigator.pushNamed(context, routeIEScreen, arguments: [
                GradientBox(
                    amount: totalExpense,
                    title: "Expense",
                    gradient1: expenseDark,
                    gradient2: expenseLight,
                    openDetail: null),
                "Expense"
              ]);
            }
          },
        ),
      ],
    );
  }
}
