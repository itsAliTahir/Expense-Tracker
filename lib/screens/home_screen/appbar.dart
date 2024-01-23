import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.window,
          color: Colors.white,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
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
    );
  }
}
