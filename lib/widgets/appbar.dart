// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../provider/themes_data.dart';

class MyAppBar extends StatelessWidget {
  var openDrawer;
  String title;
  MyAppBar(this.openDrawer, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)!.settings.name;

    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(
          routeName == routeIEScreen
              ? Icons.arrow_back_ios_new
              : FluentIcons.re_order_dots_horizontal_24_regular,
          size: routeName == routeIEScreen ? 22 : 28,
          color: Colors.black,
        ),
        onPressed: () {
          openDrawer();
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: font1,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 7,
            color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
