import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  static final textScaleFactor = 1.15;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Go Back",
              style: TextStyle(color: Colors.blue),
              textScaleFactor: textScaleFactor,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Go Somewhere",
              style: TextStyle(color: Colors.red),
              textScaleFactor: textScaleFactor,
            ),
          ),
        ],
      ),
    );
  }
}
