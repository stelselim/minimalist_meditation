import 'package:flutter/material.dart';
import 'package:meditate/constant/styles/color.dart';
import 'package:meditate/infrastructure/dummy_data.dart';
import 'package:meditate/presentation/widgets/general/app_icon.dart';
import 'package:meditate/presentation/widgets/player/player_avatar.dart';
import 'package:meditate/presentation/widgets/stats/name_text.dart';
import 'package:meditate/presentation/widgets/stats/statistics_chart.dart';
import 'package:meditate/presentation/widgets/stats/total_time.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              PlayerAvatarWithNetworkImage(
                imageUrl: playerImage,
              ),
              Positioned(
                top: 4,
                child: AppIconBig(
                  color: backgroundColor,
                  size: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          NameText(
            nameText: "Minimalist Meditation",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TabBar(
            controller: tabController,
            indicatorWeight: 3,
            indicatorColor: Color.fromRGBO(149, 203, 207, 1),
            tabs: [
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  "STATS",
                  textScaleFactor: 1.15,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  "CALENDAR",
                  textScaleFactor: 1.15,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  alignment: Alignment.center,
                  child: StatisticsChartTab(),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: TotalTimeTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
