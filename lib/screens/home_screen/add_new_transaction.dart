import 'package:cash_book_expense_tracker/widgets/datetime_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../provider/themes_data.dart';
import '../../widgets/gradient_box.dart';

void OpenShowDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => const MyAddTransactionDialog());
}

bool isCategorySelected = false;
var _titleController = TextEditingController();
var _amountController = TextEditingController();
var _descriptionController = TextEditingController();
var _titleFocus = FocusNode();
var _amountFocus = FocusNode();
var _descriptionFocus = FocusNode();
final _formKey = GlobalKey<FormState>();
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

class MyAddTransactionDialog extends StatefulWidget {
  const MyAddTransactionDialog({super.key});

  @override
  State<MyAddTransactionDialog> createState() => _MyAddTransactionDialogState();
}

class _MyAddTransactionDialogState extends State<MyAddTransactionDialog> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    double screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(30),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: screenWidth >= 300
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DateTimeContainerWidget(
                              width: 90,
                              icon: FluentIcons.clock_24_regular,
                              string: "15:00 AM",
                              onTap: () {
                                MyDateTimePicker obj = MyDateTimePicker();
                                obj.presentTimePicker(context);
                              },
                            ),
                            DateTimeContainerWidget(
                              width: 110,
                              icon: FluentIcons.calendar_24_regular,
                              string: "Feb 21, 2024",
                              onTap: () {
                                MyDateTimePicker obj = MyDateTimePicker();
                                obj.presentDatePicker(context);
                              },
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
                    controller: _titleController,
                    focusNode: _titleFocus,
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(
                            color: iconColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: font1),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: selectDark, width: 2))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Title';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (screenWidth * 0.6) - 80,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        child: TextFormField(
                          controller: _amountController,
                          focusNode: _amountFocus,
                          decoration: InputDecoration(
                            labelText: "Amount",
                            labelStyle: TextStyle(
                                color: iconColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: font1),
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: selectDark, width: 2)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Title';
                            }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _titleFocus.unfocus();
                            _amountFocus.unfocus();
                            _descriptionFocus.unfocus();
                            isCategorySelected = !isCategorySelected;
                          });
                        },
                        child: SizedBox(
                          width: (screenWidth * 0.4) - 40,
                          height: 62,
                          child: Stack(
                            children: [
                              Positioned(
                                // right: 15,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 3.4),
                                  width: (screenWidth * 0.3),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: isCategorySelected ? 2 : 1.2,
                                        color: isCategorySelected
                                            ? selectDark
                                            : fieldColor),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      screenWidth > 265
                                          ? SizedBox(
                                              width: screenWidth * 0.2 - 15,
                                              height: 22,
                                              child: const Center(
                                                  child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Text("Misc"))))
                                          : const SizedBox(),
                                      screenWidth > 265
                                          ? Container(
                                              width: 1,
                                              height: 30,
                                              color: fieldColor,
                                            )
                                          : const SizedBox(),
                                      Icon(
                                        FluentIcons.puzzle_piece_20_filled,
                                        color: iconColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: -3.5,
                                  left: 9,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 5),
                                    color: Colors.white,
                                    child: screenWidth > 280
                                        ? Text(
                                            "Category",
                                            style: TextStyle(
                                              color: iconColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: font1,
                                              fontSize: 11,
                                            ),
                                          )
                                        : Text(
                                            "Type",
                                            style: TextStyle(
                                              color: iconColor,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: font1,
                                              fontSize: 11.5,
                                            ),
                                          ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 5,
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    focusNode: _descriptionFocus,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: font1),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: selectDark, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Title';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth <= 275
                          ? screenWidth * 0.27
                          : screenWidth * 0.3,
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: GradientBox(
                          amountEnable: false,
                          amount: 0,
                          title: "Cash In",
                          gradient1: incomeDark,
                          gradient2: incomeLight,
                          openDetail: () {
                            if (_formKey.currentState!.validate()) {
                              print("object");
                            }
                            print("object2");
                          }),
                    ),
                    Container(
                      width: screenWidth <= 275
                          ? screenWidth * 0.27
                          : screenWidth * 0.3,
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      child: GradientBox(
                          amountEnable: false,
                          amount: 0,
                          title: "Cash Out",
                          gradient1: expenseDark,
                          gradient2: expenseLight,
                          openDetail: () {}),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
