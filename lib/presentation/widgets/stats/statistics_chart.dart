import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<int>> getPomodoroStatisticsWithLastTenDays() async {
  final instance = await SharedPreferences.getInstance();
  List<int> days = [];

  for (int i = 0; i < 10; i++) {
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

class StaatisticsChart extends StatelessWidget {
  const StaatisticsChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
        future: getPomodoroStatisticsWithLastTenDays(),
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
          final date7 = DateTime.now().subtract(Duration(days: 7));
          final date8 = DateTime.now().subtract(Duration(days: 8));
          final date9 = DateTime.now().subtract(Duration(days: 9));
          return Container();
        });
  }
}
