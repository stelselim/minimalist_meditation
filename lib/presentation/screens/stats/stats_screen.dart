import 'package:flutter/material.dart';
import 'package:meditate/presentation/widgets/general/app_icon.dart';

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
          AppIconBig(
            size: MediaQuery.of(context).size.width * 0.6,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Selim Üstel",
            textScaleFactor: 2.5,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          TabBar(
            controller: tabController,
            tabs: [
              Container(
                child: Text("HEY"),
              ),
              Container(
                child: Text("HEY"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  child: Text("HEY"),
                ),
                Container(
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
