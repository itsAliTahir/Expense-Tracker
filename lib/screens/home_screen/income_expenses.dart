import 'package:flutter/material.dart';

class MyIncomeExpenses extends StatelessWidget {
  const MyIncomeExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 156, 128, 241),
                Color.fromARGB(255, 169, 185, 250)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        Container(
          width: screenWidth * 0.4,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 255, 85, 119),
                Color.fromARGB(255, 251, 146, 131)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
      ],
    );
  }
}
