// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:provider/provider.dart';

import '../../provider/transaction_data_provider.dart';

class MyCurrentBalance extends StatefulWidget {
  const MyCurrentBalance({super.key});

  @override
  State<MyCurrentBalance> createState() => _MyCurrentBalanceState();
}

class _MyCurrentBalanceState extends State<MyCurrentBalance> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final CurrentBalance =
        Provider.of<TransactionDataProvider>(context, listen: false)
            .CurrentBalance;
    return Center(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 15, vertical: screenHeight * 0.04),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedFlipCounter(
                value: CurrentBalance(),
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
            ],
          ),
        ),
      ),
    );
  }
}

// https://pub.dev/packages/animated_flip_counter