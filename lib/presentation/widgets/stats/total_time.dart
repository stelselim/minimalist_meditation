import 'package:flutter/material.dart';
import 'package:meditate/presentation/utility/statistics_utilities.dart';

class TotalTimeTab extends StatelessWidget {
  const TotalTimeTab({Key key}) : super(key: key);

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
        });
  }
}
