import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/data_provider.dart';

class MyTransactionsList extends StatelessWidget {
  const MyTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsList =
        Provider.of<TransactionDataProvider>(context, listen: false).allitems;
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) => Container(),
      ),
    );
  }
}
