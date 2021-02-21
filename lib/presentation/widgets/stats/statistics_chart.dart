import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditate/presentation/utility/statistics_utilities.dart';

class StatisticsChartTab extends StatelessWidget {
  const StatisticsChartTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<int, BarChartGroupData>>(
        future: groupDataList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Problem");
          }

          final statsList = snapshot.data;

          return StatsBarChart(
            mondayData: statsList[0],
            tuesdayData: statsList[1],
            wednesdayData: statsList[2],
            thursdayData: statsList[3],
            fridayData: statsList[4],
            saturdayData: statsList[5],
            sundayData: statsList[6],
          );
        });
  }
}

class StatsBarChart extends StatelessWidget {
  static final Color leftBarColor = const Color(0xff53fdd7);
  static final Color rightBarColor = const Color(0xffff5182);

  final BarChartGroupData mondayData;
  final BarChartGroupData tuesdayData;
  final BarChartGroupData wednesdayData;
  final BarChartGroupData thursdayData;
  final BarChartGroupData fridayData;
  final BarChartGroupData saturdayData;
  final BarChartGroupData sundayData;

  static const sideTitleTextStyle = const TextStyle(
      color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14);

  const StatsBarChart({
    Key key,
    this.mondayData,
    this.tuesdayData,
    this.wednesdayData,
    this.thursdayData,
    this.fridayData,
    this.saturdayData,
    this.sundayData,
  }) : super(key: key);

  static String getTitleX(double value) {
    switch (value.toInt()) {
      case 0:
        return 'Mn';
      case 1:
        return 'Te';
      case 2:
        return 'Wd';
      case 3:
        return 'Tu';
      case 4:
        return 'Fr';
      case 5:
        return 'St';
      case 6:
        return 'Sn';
      default:
        return '';
    }
  }

  static String getTitleY(double value) {
    {
      if (value == 60) {
        return "1h";
      }
      if (value == 180) {
        return "3h";
      }
      if (value == 300) {
        return "5h";
      }
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      mondayData,
      tuesdayData,
      wednesdayData,
      thursdayData,
      fridayData,
      saturdayData,
      sundayData,
    ];

    return Card(
      elevation: 0,
      color: const Color(0xff2c4260),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  CupertinoIcons.chart_bar_square_fill,
                  color: Colors.white,
                  size: 35,
                ),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  'Daily Minutes',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BarChart(
                  BarChartData(
                    maxY: 300,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey.shade300,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                            BarTooltipItem(
                          "${(rod.y).toInt()} min",
                          TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => sideTitleTextStyle,
                        getTitles: (double value) => getTitleX(value),
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => sideTitleTextStyle,
                        margin: 32,
                        // reservedSize: 14,
                        getTitles: (value) => getTitleY(value),
                      ),
                    ),
                    barGroups: items,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
