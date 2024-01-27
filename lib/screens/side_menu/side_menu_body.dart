import 'package:flutter/material.dart';

class MySideMenu extends StatefulWidget {
  const MySideMenu({super.key});

  @override
  State<MySideMenu> createState() => _MySideMenuState();
}

class _MySideMenuState extends State<MySideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.black,
        width: 288,
        height: double.infinity,
      )),
    );
  }
}
