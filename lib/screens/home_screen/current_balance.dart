import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class MyCurrentBalance extends StatefulWidget {
  const MyCurrentBalance({super.key});

  @override
  State<MyCurrentBalance> createState() => _MyCurrentBalanceState();
}

class _MyCurrentBalanceState extends State<MyCurrentBalance> {
  num temp = 120;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 15, vertical: screenHeight * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedFlipCounter(
              value: temp,
              prefix: "\$",
              textStyle: const TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Current Balance",
              style: TextStyle(
                  fontFamily: "Raleway",
                  letterSpacing: 1,
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            // TextButton(
            //   onPressed: () {
            //     temp = temp + 100;
            //     setState(() {});
            //   },
            //   child: const Text("data"),
            // )
          ],
        ),
      ),
    );
  }
}

// https://pub.dev/packages/animated_flip_counter