import 'dart:ffi';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

void OpenShowDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => const MyAddTransactionDialog());
}

Widget DateTimeContainerWidget(
    {required double width,
    required IconData icon,
    required String string,
    required Function onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 247, 247),
          borderRadius: BorderRadius.circular(7)),
      child: Row(children: [
        Icon(
          icon,
          size: 18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          string,
          style: const TextStyle(fontSize: 11),
        )
      ]),
    ),
  );
}

class MyAddTransactionDialog extends StatelessWidget {
  const MyAddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    double screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
              child: screenWidth >= 290
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DateTimeContainerWidget(
                          width: 90,
                          icon: FluentIcons.clock_24_regular,
                          string: "15:00 AM",
                          onTap: () {},
                        ),
                        DateTimeContainerWidget(
                          width: 110,
                          icon: FluentIcons.calendar_24_regular,
                          string: "Feb 21, 2024",
                          onTap: () {},
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: DateTimeContainerWidget(
                            width: 90,
                            icon: FluentIcons.clock_24_regular,
                            string: "15:00 AM",
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: DateTimeContainerWidget(
                            width: 110,
                            icon: FluentIcons.calendar_24_regular,
                            string: "Feb 21, 2024",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 5,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width * 0.9) - 135,
                  height: 50,
                  margin: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Amount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 75,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 15,
                        child: Container(
                          margin: const EdgeInsets.only(top: 3),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 117, 117, 117)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -4,
                          left: 19,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            color: Colors.white,
                            child: const Text(
                              "Type",
                              style: TextStyle(
                                color: Color.fromARGB(255, 92, 92, 92),
                                fontSize: 11,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 5,
              ),
              child: TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Desciption",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
