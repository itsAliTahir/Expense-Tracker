import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
        icon: Icon(
          FluentIcons.re_order_dots_horizontal_24_regular,
          size: 28,
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
          fontSize: 15,
          letterSpacing: 7,
        ),
      ),
      centerTitle: true,
    );
  }
}
