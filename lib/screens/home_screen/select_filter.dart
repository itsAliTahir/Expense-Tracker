import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MySelectType extends StatefulWidget {
  MySelectType({super.key});

  @override
  State<MySelectType> createState() => _MySelectTypeState();
}

class _MySelectTypeState extends State<MySelectType> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: show ? 95 : 40,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.08, right: screenWidth * 0.03),
            child: Row(
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
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  // icon: Icon(Icons.close),
                  icon: Icon(FluentIcons.filter_12_regular),
                  style: ButtonStyle(iconSize: MaterialStatePropertyAll(20)),
                )
              ],
            ),
          ),
          show
              ? Positioned(
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.all(0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          for (int i = 0; i < 10; i++)
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "data",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontFamily: "Raleway"),
                                ))
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
