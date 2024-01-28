import 'package:cash_book_expense_tracker/screens/home_screen/appbar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
    final List args = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(GoBack, args[1] as String)),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: args[0] as Widget,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  "Total ${args[1] as String}",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, top: 20),
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: LineChart(
                      LineChartData(
                          backgroundColor: Colors.transparent,
                          borderData: FlBorderData(
                              border: Border(
                                  // right: BorderSide(color: Colors.black),
                                  // bottom: BorderSide(color: Colors.black),
                                  )),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(drawBelowEverything: false),
                            topTitles: AxisTitles(drawBelowEverything: false),
                          ),
                          gridData: FlGridData(
                            checkToShowHorizontalLine: (value) => true,
                            checkToShowVerticalLine: (value) => false,
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: args[1] == "Income"
                                      ? [
                                          ColorTween(
                                                  begin: incomeLight,
                                                  end: incomeLight)
                                              .lerp(1)!
                                              .withOpacity(0.2),
                                          ColorTween(
                                                  begin: incomeLight,
                                                  end: incomeLight)
                                              .lerp(1)!
                                              .withOpacity(0.2),
                                        ]
                                      : [
                                          ColorTween(
                                                  begin: expenseLight,
                                                  end: expenseLight)
                                              .lerp(1)!
                                              .withOpacity(0.2),
                                          ColorTween(
                                                  begin: expenseLight,
                                                  end: expenseLight)
                                              .lerp(1)!
                                              .withOpacity(0.2),
                                        ],
                                ),
                              ),
                              gradient: LinearGradient(
                                  colors: args[1] == "Income"
                                      ? [incomeDark, incomeLight]
                                      : [expenseDark, expenseLight]),
                              // dashArray: [1, 2, 3, 4, 5],

                              dotData: FlDotData(
                                checkToShowDot: (spot, barData) {
                                  // if (spot.x == 0 && spot.y == 0) {
                                  return false;
                                  // } else {
                                  // return true;
                                  // }
                                },
                              ),
                              dashArray: [
                                2,
                                5,
                                10,
                                5,
                              ],
                              spots: const [
                                FlSpot(0, 0),
                                FlSpot(1, 3),
                                FlSpot(2, 7),
                                FlSpot(3, 14),
                                FlSpot(4, 19),
                                FlSpot(5, 20),
                                FlSpot(6, 22),
                                FlSpot(7, 28),
                                FlSpot(8, 40),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//https://pub.dev/packages/fl_animated_linechart/example