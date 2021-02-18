import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.nightlight_round,
        size: 75,
        color: Colors.white,
      ),
    );
  }
}
