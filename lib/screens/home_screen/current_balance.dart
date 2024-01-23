import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class MyCurrentBalance extends StatefulWidget {
  const MyCurrentBalance({super.key});

  @override
  State<MyCurrentBalance> createState() => _MyCurrentBalanceState();
}

class _MyCurrentBalanceState extends State<MyCurrentBalance> {
  num temp = 12500;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedFlipCounter(
              value: temp,
              prefix: "\$",
              textStyle: const TextStyle(
                  fontFamily: "Raleway", color: Colors.white, fontSize: 34),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Current Balance",
              style: TextStyle(
                  fontFamily: "Raleway",
                  letterSpacing: 1,
                  color: Color.fromARGB(255, 83, 86, 109),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                temp = temp + 100;
                setState(() {});
              },
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}

// https://pub.dev/packages/animated_flip_counter