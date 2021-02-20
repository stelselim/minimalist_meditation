import 'package:flutter/material.dart';

class SmallMoodCard extends StatelessWidget {
  const SmallMoodCard({Key key, this.onPressForNavigation, this.imagePath})
      : super(key: key);

  final Function onPressForNavigation;
  final String imagePath;
  static const backgroundColor = Color.fromRGBO(255, 255, 255, 0.9);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}
