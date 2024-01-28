import 'package:cash_book_expense_tracker/screens/income_expense_detail_screen/income_expense_detail_screen_body.dart';
import 'package:provider/provider.dart';
import 'provider/category_data_provider.dart';
import 'provider/themes_data.dart';
import 'package:flutter/material.dart';

import 'provider/transaction_data_provider.dart';
import 'screens/home_screen/home_screen_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryDataProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            appBarTheme: AppBarTheme(color: lightThemeScaffold),
            drawerTheme: DrawerThemeData(
                backgroundColor: lightThemeDrawerBackgroundColor),
            secondaryHeaderColor: lightThemeSecondaryFont,
            scaffoldBackgroundColor: lightThemeScaffold),
        // darkTheme: ThemeData(
        //     appBarTheme: AppBarTheme(color: darkThemeScaffold),
        //     drawerTheme:
        //         DrawerThemeData(backgroundColor: darkThemeDrawerBackgroundColor),
        //     secondaryHeaderColor: darkThemeSecondaryFont,
        //     scaffoldBackgroundColor: darkThemeScaffold),
        themeMode: ThemeMode.light,
        // home: MyHomeScreenBody(),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomeScreenBody(),
          '/incomeexpensedetailscreenbody': (context) =>
              const MyIncomeExpenseDetailScreenBody()
        },
      ),
    );
  }
}
