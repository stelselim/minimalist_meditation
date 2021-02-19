import 'package:flutter/material.dart';

import 'app_icon.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key key}) : super(key: key);

  static const iconSize = 35.0;
  static const iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: IconButton(
          color: iconColor,
          icon: Icon(Icons.ac_unit_sharp),
          onPressed: () {},
          iconSize: iconSize,
        ),
        title: AppIcon(),
        trailing: IconButton(
          color: iconColor,
          icon: Icon(Icons.today),
          onPressed: () {},
          iconSize: iconSize,
        ),
      ),
    );
  }
}
