import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  var openDrawer;
  MyAppBar(this.openDrawer, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(
          FluentIcons.re_order_dots_horizontal_24_regular,
          size: 28,
        ),
        onPressed: () {
          // Scaffold.of(context).openDrawer();
          openDrawer();
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
