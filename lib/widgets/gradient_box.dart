import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../provider/themes_data.dart';

// ignore: must_be_immutable
class GradientBox extends StatelessWidget {
  num amount;
  String title;
  Color gradient1;
  Color gradient2;
  void Function()? openDetail;
  GradientBox(
      {required this.amount,
      required this.title,
      required this.gradient1,
      required this.gradient2,
      required this.openDetail,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Hero(
      tag: title,
      child: Bounceable(
        onTap: () {},
        child: GestureDetector(
          onTap: amount != 0 ? openDetail : null,
          child: Container(
            width: screenWidth * 0.4,
            height: 70,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
              gradient: LinearGradient(
                colors: [gradient1, gradient2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: AnimatedFlipCounter(
                    value: amount,
                    prefix: "\$",
                    duration: const Duration(milliseconds: 1000),
                    textStyle: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: font3,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: font1,
                    letterSpacing: 1,
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
