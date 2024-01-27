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
            gradient1: const Color.fromARGB(255, 156, 128, 241),
            gradient2: const Color.fromARGB(255, 169, 185, 250)),
        GradientBox(
          amount: TotalExpense(),
          title: "Expense",
          gradient1: const Color.fromARGB(255, 255, 85, 119),
          gradient2: const Color.fromARGB(255, 251, 146, 131),
        ),
      ],
    );
  }
}
