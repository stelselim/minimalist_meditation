import 'package:flutter/material.dart';

class TotalTime extends StatelessWidget {
  const TotalTime({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Duration todayWorkTime = Duration(minutes: 70);
    final Duration yesterdayWorkTime = Duration(minutes: 30);
    final Duration lastWeekTime = Duration(minutes: 150);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              "Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              "${todayWorkTime.inHours} hour(s) ${todayWorkTime.inMinutes - todayWorkTime.inHours * 60} min(s)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "Yesterday",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              "${yesterdayWorkTime.inHours} hour(s) ${yesterdayWorkTime.inMinutes - yesterdayWorkTime.inHours * 60} min(s)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          ListTile(
            title: Text(
              "Last Week",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: Text(
              "${lastWeekTime.inHours} hour(s) ${lastWeekTime.inMinutes - lastWeekTime.inHours * 60} min(s)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
