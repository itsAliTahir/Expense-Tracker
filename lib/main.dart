import 'package:cash_book_expense_tracker/provider/category_data_provider.dart';
import 'package:provider/provider.dart';
import 'provider/themes_data.dart';
import 'package:flutter/material.dart';
import 'provider/transaction_data_provider.dart';
import 'screens/home_screen/home_screen_body.dart';
import 'screens/home_screen/income_expense_detail_screen/income_expense_detail_screen_body.dart';

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
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: font3)),
                    foregroundColor: MaterialStatePropertyAll(
                      selectDark,
                    ))),
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
        // home: MyHomePage(),
        initialRoute: routeHome,
        routes: {
          routeHome: (context) => const MyHomeScreenBody(),
          routeIEScreen: (context) => const MyIncomeExpenseDetailScreenBody()
        },
      ),
    );
  }
}

// https://pub.dev/packages/flutter_bounceable/example
// https://pub.dev/packages/bouncy_widget
