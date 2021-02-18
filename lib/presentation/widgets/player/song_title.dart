import 'package:flutter/material.dart';

class SongTitle extends StatelessWidget {
  // final AudioModel audioModel;
  const SongTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        subtitle: Text(
          "By: Painting with Passion",
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.white38),
        ),
        title: Text(
          "Painting Forest",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
