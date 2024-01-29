import 'package:cash_book_expense_tracker/widgets/title.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MySelectType extends StatefulWidget {
  const MySelectType({super.key});

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
      duration: const Duration(milliseconds: 200),
      height: show ? 95 : 50,
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.08,
                right: screenWidth * 0.03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  screenWidth > 155
                      ? CustomTitle(title: "Transactions")
                      : const SizedBox(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: Icon(
                        show ? Icons.close : FluentIcons.filter_12_regular),
                    style: const ButtonStyle(
                        iconSize: MaterialStatePropertyAll(20)),
                  ),
                ],
              ),
            ),
          ),
          if (show)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    for (int i = 0; i < 10; i++)
                      DelayedDisplay(
                        delay: const Duration(milliseconds: 200),
                        slidingBeginOffset: Offset((i + 1) * 1, 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "data",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
