import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  num amount;
  String title;
  Color gradient1;
  Color gradient2;
  GradientBox(
      {required this.amount,
      required this.title,
      required this.gradient1,
      required this.gradient2,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.4,
      height: 70,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 3, bottom: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2), // Set shadow offset
              blurRadius: 2, // Set blur radius for a shadow effect
            ),
          ],
          gradient: LinearGradient(
              colors: [gradient1, gradient2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: AnimatedFlipCounter(
              value: amount,
              prefix: "\$",
              textStyle: const TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontFamily: "Raleway",
                letterSpacing: 1,
                color: Color.fromARGB(255, 224, 224, 224),
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
