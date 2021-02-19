import 'package:flutter/material.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        maxRadius: MediaQuery.of(context).size.width * 0.5,
        child: Text("Simple Meditation"),
      ),
    );
  }
}
