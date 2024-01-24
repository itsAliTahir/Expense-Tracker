import 'package:flutter/material.dart';

class MySelectCategory extends StatelessWidget {
  const MySelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.055),
      padding: EdgeInsets.only(left: screenWidth * 0.08),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "All",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Incomes",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Expenses",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
