import 'package:cash_book_expense_tracker/provider/category_data_provider.dart';
import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/transaction_data_provider.dart';

class MyTransactionsList extends StatelessWidget {
  const MyTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsList =
        Provider.of<TransactionDataProvider>(context, listen: false).fullList;
    final allCategories =
        Provider.of<CategoryDataProvider>(context, listen: false).allCategories;
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 60),
        itemCount: itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          return DelayedDisplay(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: ListTile(
                horizontalTitleGap: 25,
                leading: Icon(allCategories[itemsList[index].iconId].icon),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemsList[index].title,
                      style: const TextStyle(
                          fontFamily: "Raleway",
                          letterSpacing: 1,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      itemsList[index].date,
                      style: TextStyle(
                          // fontFamily: "Raleway",
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                trailing: Text(
                  "\$${itemsList[index].amount.toString()}",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      color: itemsList[index].amount >= 0
                          ? incomeDark
                          : expenseDark),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return DelayedDisplay(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30), child: Divider()),
          );
        },
      ),
    );
  }
}
