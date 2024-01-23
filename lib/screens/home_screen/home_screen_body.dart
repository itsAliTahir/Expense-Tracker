import 'package:flutter/material.dart';

class MyHomeScreenBody extends StatelessWidget {
  const MyHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.window,
          color: Colors.white,
        ),
        title: const Text(
          "CASH BOOK",
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 7,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(),
    );
  }
}
