import 'package:flutter/material.dart';

class MyBottomDetailSheet extends StatelessWidget {
  const MyBottomDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: screenHeight * 0.56,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
