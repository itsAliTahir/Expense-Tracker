import 'package:cash_book_expense_tracker/provider/data_provider.dart';
import 'package:cash_book_expense_tracker/screens/home_screen/home_screen_body.dart';
import 'package:provider/provider.dart';
import 'provider/themes_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                const TextTheme(titleLarge: TextStyle(color: Colors.black)),
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
        home: const MyHomeScreenBody(),
      ),
    );
  }
}
