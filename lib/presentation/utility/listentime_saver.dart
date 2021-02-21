import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveListenTimeToLocal(int toAddlistenTimeInSeconds) async {
  final instance = await SharedPreferences.getInstance();
  final today = DateTime.now();
  final todayKey = today.month.toString() +
      "-" +
      today.day.toString() +
      "-" +
      today.year.toString();

  var todayStatisticsTime = instance.getInt(todayKey);
  if (todayStatisticsTime == null) {
    todayStatisticsTime = 0;
  }

  final todayWork = todayStatisticsTime + toAddlistenTimeInSeconds;
  await instance.setInt(todayKey, todayWork);
}
