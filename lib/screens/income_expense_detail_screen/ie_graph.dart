// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:delayed_display/delayed_display.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/themes_data.dart';
import '../../provider/transaction_data_provider.dart';

class MyIncomeExpenseGraph extends StatelessWidget {
  var args;
  MyIncomeExpenseGraph(this.args, {super.key});
  List<num> sumList = [];
  num temp = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final data = args[1] as String == "Income"
        ? Provider.of<TransactionDataProvider>(context, listen: false)
            .incomeList
        : Provider.of<TransactionDataProvider>(context, listen: false)
            .expenseList;

    for (int i = 0; i < data.length; i++) {
      if (data[i].amount < 0) {
        temp = temp + (data[i].amount * -1);
      } else {
        temp = temp + data[i].amount;
      }
      sumList.add(temp);
    }

    return DelayedDisplay(
      slidingBeginOffset: const Offset(0, 0.2),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, top: 20, left: 10),
          child: SizedBox(
            height: screenHeight * 0.2,
            child: Center(
              child: LineChart(
                LineChartData(
                    backgroundColor: Colors.transparent,
                    lineTouchData: const LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.white,
                      tooltipPadding: EdgeInsets.all(0),
                    )),
                    borderData: FlBorderData(border: const Border()),
                    titlesData: const FlTitlesData(
                      rightTitles: AxisTitles(drawBelowEverything: false),
                      leftTitles: AxisTitles(drawBelowEverything: false),
                      topTitles: AxisTitles(drawBelowEverything: false),
                    ),
                    gridData: FlGridData(
                      checkToShowHorizontalLine: (value) => true,
                      checkToShowVerticalLine: (value) => false,
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        belowBarData: BarAreaData(
                          show: false,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: args[1] == "Income"
                                ? [
                                    ColorTween(
                                            begin: incomeDark, end: incomeDark)
                                        .lerp(1)!
                                        .withOpacity(0.4),
                                    ColorTween(
                                            begin: incomeLight,
                                            end: incomeLight)
                                        .lerp(1)!
                                        .withOpacity(0.3),
                                    ColorTween(
                                            begin: Colors.white,
                                            end: Colors.white)
                                        .lerp(1)!
                                        .withOpacity(0.0),
                                  ]
                                : [
                                    ColorTween(
                                            begin: expenseDark,
                                            end: expenseDark)
                                        .lerp(1)!
                                        .withOpacity(0.4),
                                    ColorTween(
                                            begin: expenseLight,
                                            end: expenseLight)
                                        .lerp(1)!
                                        .withOpacity(0.3),
                                    ColorTween(
                                            begin: Colors.white,
                                            end: Colors.white)
                                        .lerp(1)!
                                        .withOpacity(0.0),
                                  ],
                          ),
                        ),
                        gradient: LinearGradient(
                            colors: args[1] == "Income"
                                ? [incomeDark, incomeLight]
                                : [expenseDark, expenseLight]),
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                                  radius: 4,
                                  color: args[1] == "Income"
                                      ? expenseDark
                                      : incomeDark,
                                  strokeColor: Colors.white,
                                  strokeWidth: 1.5),
                          checkToShowDot: (spot, barData) {
                            if (spot.x == 0 && spot.y == 0) {
                              return false;
                            } else {
                              return true;
                            }
                          },
                        ),
                        // dashArray: [
                        //   2,
                        //   5,
                        //   10,
                        //   5,
                        // ],
                        spots: [
                          const FlSpot(0, 0),
                          for (int i = 1; i <= sumList.length; i++)
                            FlSpot(i.toDouble(), sumList[i - 1].toDouble()),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//https://pub.dev/packages/fl_animated_linechart/example