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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 20),
        child: SizedBox(
          height: 200,
          child: Center(
            child: LineChart(
              LineChartData(
                  backgroundColor: Colors.transparent,
                  lineTouchData: LineTouchData(
                      touchTooltipData:
                          LineTouchTooltipData(tooltipBgColor: Colors.black)),
                  borderData: FlBorderData(border: const Border()),
                  titlesData: const FlTitlesData(
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
                                          begin: incomeLight, end: incomeLight)
                                      .lerp(1)!
                                      .withOpacity(0.2),
                                  ColorTween(
                                          begin: incomeLight, end: incomeLight)
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
                      spots: [
                        FlSpot(0, 0),
                        for (int i = 1; i <= sumList.length; i++)
                          FlSpot(i.toDouble(), sumList[i - 1].toDouble()),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
