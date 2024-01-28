import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/transaction_data_provider.dart';
import '../../widgets/gradient_box.dart';

class MyIncomeExpenses extends StatelessWidget {
  const MyIncomeExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    final TotalIncome =
        Provider.of<TransactionDataProvider>(context, listen: false)
            .TotalIncome;
    final TotalExpense =
        Provider.of<TransactionDataProvider>(context, listen: false)
            .TotalExpense;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GradientBox(
            amount: TotalIncome(),
            title: "Income",
            gradient1: incomeDark,
            gradient2: incomeLight,
            openDetail: () {}),
        GradientBox(
          amount: TotalExpense(),
          title: "Expense",
          gradient1: expenseDark,
          gradient2: expenseLight,
          openDetail: () {},
        ),
      ],
    );
  }
}
