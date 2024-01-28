import 'package:cash_book_expense_tracker/screens/home_screen/appbar.dart';
import 'package:flutter/material.dart';
import '../../provider/themes_data.dart';
import '../../widgets/gradient_box.dart';

class MyIncomeExpenseDetailScreenBody extends StatefulWidget {
  const MyIncomeExpenseDetailScreenBody({super.key});

  @override
  State<MyIncomeExpenseDetailScreenBody> createState() =>
      _MyIncomeExpenseDetailScreenBodyState();
}

class _MyIncomeExpenseDetailScreenBodyState
    extends State<MyIncomeExpenseDetailScreenBody> {
  void GoBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56), child: MyAppBar(GoBack)),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: args as Widget,
            ),
          ],
        ),
      ),
    );
  }
}
