// ignore_for_file: non_constant_identifier_names

import 'package:cash_book_expense_tracker/provider/themes_data.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)!.settings.name;

    Widget MyListTile({
      required String title,
      required IconData icon,
      required String myRouteName,
    }) {
      return Container(
        width: 200,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: routeName == myRouteName
                    ? [selectDark, selectLight]
                    : [
                        Colors.transparent,
                        Colors.transparent,
                      ])),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minLeadingWidth: 30,
          leading: Icon(icon,
              color: routeName == myRouteName ? Colors.white : iconColor),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: routeName == myRouteName ? Colors.white : iconColor,
              fontSize: 15,
              fontFamily: font1,
            ),
          ),
          onTap: () {},
        ),
      );
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 50),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      final GlobalKey<ScaffoldState> scaffoldKey =
                          GlobalKey<ScaffoldState>();
                      scaffoldKey.currentState?.closeDrawer();
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                        // gradient: LinearGradient(colors: [
                        //   floatingActionColor1,
                        //   floatingActionColor2
                        // ])
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MyListTile(
                    title: "Home",
                    icon: FluentIcons.home_32_filled,
                    myRouteName: routeHome),
                MyListTile(
                    title: "Analysis",
                    icon: FluentIcons.data_area_20_filled,
                    myRouteName: " "),
                MyListTile(
                    title: "Logs",
                    icon: FluentIcons.pen_20_filled,
                    myRouteName: " "),
                MyListTile(
                    title: "Settings",
                    icon: FluentIcons.settings_32_filled,
                    myRouteName: " "),
                MyListTile(
                    title: "Storage",
                    icon: FluentIcons.cloud_32_filled,
                    myRouteName: " "),
              ]),
        ),
      ),
    );
  }
}
