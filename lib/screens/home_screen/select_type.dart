import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MySelectType extends StatelessWidget {
  const MySelectType({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
      padding:
          EdgeInsets.only(left: screenWidth * 0.08, right: screenWidth * 0.03),
      child: Column(
        children: [
          Row(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transactions",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 1.5,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
                style: ButtonStyle(iconSize: MaterialStatePropertyAll(24)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
