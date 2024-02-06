// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:cash_book_expense_tracker/widgets/circular_gradient_icon_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../provider/category_data_provider.dart';
import '../provider/models/transaction_model.dart';

OpenModalBottomSheet(BuildContext context, Transaction item) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    elevation: 0,
    context: context,
    builder: (context) => MyBottomDetailSheet(
      item: item,
    ),
  );
}

class MyBottomDetailSheet extends StatelessWidget {
  Transaction item;
  MyBottomDetailSheet({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final iconList =
        Provider.of<CategoryDataProvider>(context, listen: false).allCategories;
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: screenHeight * 0.56,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontFamily: font3,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Stack(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            item.date,
                            style: TextStyle(
                                fontFamily: font2,
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "\$${item.amount.toString()}",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: font1,
                                fontWeight: FontWeight.bold,
                                color: item.amount >= 0
                                    ? incomeDark
                                    : expenseDark),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 25),
                    Text(
                      item.description != " "
                          ? item.description
                          : "No Description",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: font2,
                          color: item.description != " "
                              ? const Color.fromARGB(255, 73, 69, 79)
                              : Theme.of(context).secondaryHeaderColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Tooltip(
              message: iconList[item.iconId].name,
              child: Bounceable(
                onTap: () {},
                child: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.only(
                    left: 50,
                    right: 20,
                    bottom: 30,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient:
                          LinearGradient(colors: [selectDark, selectLight])),
                  child: Icon(
                    iconList[item.iconId].icon,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 40,
              top: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyCircularGradientIconButton(
                      size: 40,
                      icon: FluentIcons.edit_32_filled,
                      colorsList: [incomeDark, incomeLight],
                      toolTip: "Edit",
                      onTap: () {}),
                  const SizedBox(
                    width: 3,
                  ),
                  MyCircularGradientIconButton(
                      size: 40,
                      icon: FluentIcons.delete_32_filled,
                      colorsList: [expenseDark, expenseLight],
                      toolTip: "Delete",
                      onTap: () {}),
                ],
              )),
        ],
      ),
    );
  }
}
