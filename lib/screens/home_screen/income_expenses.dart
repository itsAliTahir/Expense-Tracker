import 'package:cash_book_expense_tracker/widgets/gradient_box.dart';
import 'package:flutter/material.dart';

class MyIncomeExpenses extends StatelessWidget {
  const MyIncomeExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GradientBox(
            title: "1200",
            subTitle: "Income",
            gradient1: Color.fromARGB(255, 156, 128, 241),
            gradient2: Color.fromARGB(255, 169, 185, 250)),
        GradientBox(
          title: "1200",
          subTitle: "Expense",
          gradient1: Color.fromARGB(255, 255, 85, 119),
          gradient2: Color.fromARGB(255, 251, 146, 131),
        ),
      ],
    );
  }
}
