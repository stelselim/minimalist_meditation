import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

BarChartGroupData makeGroupData(int listenTime, double dayNumber) {
  int x = listenTime;
  var y = dayNumber;
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y,
      colors: [const Color(0xffff5182)],
      width: 9,
    ),
  ]);
}

Future<List<int>> getDailyListeningTimeWithLastSevenDay() async {
  final instance = await SharedPreferences.getInstance();
  List<int> days = [];

  for (int i = 0; i < 7; i++) {
    final today = DateTime.now().subtract(Duration(days: i));
    final todayKey = today.month.toString() +
        "-" +
        today.day.toString() +
        "-" +
        today.year.toString();
    final todayStatisticsTime = instance.getInt(todayKey);

    /// IF No Study
    if (todayStatisticsTime == null) {
      days.add(0);
      await instance.setInt(todayKey, 0);
    } else {
      days.add(todayStatisticsTime);
    }
  }

  return days;
}

class StatisticsChartTab extends StatelessWidget {
  const StatisticsChartTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
        future: getDailyListeningTimeWithLastSevenDay(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("Problem");
          }

          final statsList = snapshot.data;
          final todayWorkTime = Duration(minutes: statsList.elementAt(0));
          final yesterdayWorkTime = Duration(minutes: statsList.elementAt(1));

          final lastWeekTime = Duration(
            minutes: statsList.elementAt(0) +
                statsList.elementAt(1) +
                statsList.elementAt(2) +
                statsList.elementAt(3) +
                statsList.elementAt(4) +
                statsList.elementAt(5) +
                statsList.elementAt(6),
          );
          final fromDate = DateTime.now().subtract(Duration(days: 15));
          final toDate = DateTime.now();

          final date = DateTime.now().subtract(Duration(days: 0));
          final date1 = DateTime.now().subtract(Duration(days: 1));
          final date2 = DateTime.now().subtract(Duration(days: 2));
          final date3 = DateTime.now().subtract(Duration(days: 3));
          final date4 = DateTime.now().subtract(Duration(days: 4));
          final date5 = DateTime.now().subtract(Duration(days: 5));
          final date6 = DateTime.now().subtract(Duration(days: 6));

          // if(DateTime.now().weekday==)

          return StatsBarChart(
            mondayData: makeGroupData(1, 3),
            tuesdayData: makeGroupData(1, 3),
            wednesdayData: makeGroupData(1, 3),
            thursdayData: makeGroupData(1, 3),
            fridayData: makeGroupData(1, 3),
            saturdayData: makeGroupData(1, 3),
            sundayData: makeGroupData(1, 3),
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
      if (value == 1) {
        return "1h";
      }
      if (value == 3) {
        return "3h";
      }
      if (value == 5) {
        return "5h";
      }
      if (value == 7) {
        return "7h";
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
                    maxY: 7,
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey.shade300,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                            BarTooltipItem(
                          "${(rod.y * 60).toInt()} min",
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
