import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(38)),
      onPressed: () {},
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 79, 220, 154),
              Color.fromARGB(255, 150, 255, 218)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
