import 'package:flutter/material.dart';

void OpenShowDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => const MyAddTransactionDialog());
}

class MyAddTransactionDialog extends StatelessWidget {
  const MyAddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      content: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close))),
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
                Container(
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
