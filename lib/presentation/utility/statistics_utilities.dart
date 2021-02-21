import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

BarChartGroupData makeGroupData(int listenTimeInMinutes, int dayNumber) {
  var x = dayNumber;
  var y = listenTimeInMinutes;

  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y.toDouble(),
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
    // Saving Key
    final todayKey = today.month.toString() +
        "-" +
        today.day.toString() +
        "-" +
        today.year.toString();

    // Get Today Minutes
    var val = instance.getInt(todayKey);
    var todayStatisticsTime = 0;

    if (val != null) {
      // Saved Every 2 seconds
      // Convert To Minutes
      todayStatisticsTime = (instance.getInt(todayKey) ~/ 60);
    }

    /// IF No Study
    days.add(todayStatisticsTime);
  }

  return days;
}

Future<Map<int, BarChartGroupData>> groupDataList() async {
  List<BarChartGroupData> groupList = [];
  Map<int, BarChartGroupData> mapList = {};

  final list = await getDailyListeningTimeWithLastSevenDay();
  final todayDay = DateTime.now().weekday;
  for (var i = 0; i < list.length; i++) {
    final dayNumber = (todayDay + i) % 7;
    groupList.add(makeGroupData(list.elementAt(i), dayNumber));
  }
  for (var e in groupList) {
    mapList[e.x] = e;
  }
  return mapList;
}
