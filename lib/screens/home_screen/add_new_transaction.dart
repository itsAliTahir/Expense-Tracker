import 'dart:ffi';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

void OpenShowDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => const MyAddTransactionDialog());
}

Widget DateTimeContainerWidget(
    {required double width, required IconData icon, required String string}) {
  return Container(
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
  );
}

class MyAddTransactionDialog extends StatelessWidget {
  const MyAddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceBetween,

            children: [
              DateTimeContainerWidget(
                  width: 80, icon: FluentIcons.clock_24_regular, string: " AM"),
              DateTimeContainerWidget(
                  width: 80,
                  icon: FluentIcons.calendar_24_regular,
                  string: "2024"),
            ],
          ),
          TextFormField(),
          SizedBox(
            height: 200,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  height: 50,
                  child: TextFormField(),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
