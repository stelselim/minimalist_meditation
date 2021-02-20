import 'package:flutter/material.dart';
import 'package:meditate/constant/styles/color.dart';
import 'package:meditate/presentation/widgets/general/app_icon.dart';
import 'package:meditate/presentation/widgets/player/player_avatar.dart';
import 'package:meditate/presentation/widgets/stats/name_text.dart';

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
                imageUrl:
                    "https://s3-alpha-sig.figma.com/img/6890/1ac9/66f911e5ee11b99b7b3afe3aaa855c16?Expires=1614556800&Signature=AqL81jOtfH-~SradnqtYgrIsZI1ehTEzCQJE4Rp1pTwudv49Xb~aWaJXA7~V3x50l350Q4tGZVMJNyw2GRXXeaL0VruA-C8YIrovjMmh58QSjtFTS3o7Bv7NlB~qXgxStFGWed-iT2W3JV2B9Giu786BkY~G5z7MblJVLugWc--ZC~76oxGUAxjFj3-ZZNi~YTusfpMZ9iKUhkpStAPkDiErSr8A3D7QECL2poMsIl-gQ2kcrQbs-w4EEtP3izXJmmdqEpZy8sqb0Z4Bd1FlCvgwQPTGudyrbgRGdTzOyS5Ppo3v8xEBEpuZmD0eJWRXQcGByxMvn8Xv4PvT7HNzbA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
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
            nameText: "Selim Üstel",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
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
                  alignment: Alignment.center,
                  child: Text("HEY"),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("HEY"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
