import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/transaction_data_provider.dart';

class MyTransactionsList extends StatelessWidget {
  const MyTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsList =
        Provider.of<TransactionDataProvider>(context, listen: false).allitems;
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 60),
        itemCount: itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.house),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item $index'),
                Text('Item $index'),
              ],
            ),
            trailing: Text(
              "\$${itemsList[index].amount.toString()}",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: itemsList[index].amount >= 0
                      ? Color.fromARGB(255, 156, 128, 241)
                      : Color.fromARGB(255, 255, 85, 119)),
            ),
          );
        },
      ),
    );
  }
}
