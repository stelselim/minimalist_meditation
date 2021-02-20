import 'package:flutter/material.dart';

class SaluteText extends StatelessWidget {
  // final String titleSalute;
  // final String subtitleSalute;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListTile(
          title: Text(
            "Welcome back, Afreen!",
            textScaleFactor: 1.75,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "How are you feeling today ?",
              textScaleFactor: 1.25,
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ),
      ),
    );
  }
}
