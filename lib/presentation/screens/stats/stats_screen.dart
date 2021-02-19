import 'package:flutter/material.dart';
import 'package:meditate/presentation/widgets/general/header_bar.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: HeaderBar(),
          ),
        ],
      ),
    );
  }
}
