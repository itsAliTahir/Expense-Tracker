import 'package:flutter/material.dart';

class GradientBox extends StatelessWidget {
  String title;
  String subTitle;
  Color gradient1;
  Color gradient2;
  GradientBox(
      {required this.title,
      required this.subTitle,
      required this.gradient1,
      required this.gradient2,
      super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.4,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
              colors: [gradient1, gradient2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
    );
  }
}
