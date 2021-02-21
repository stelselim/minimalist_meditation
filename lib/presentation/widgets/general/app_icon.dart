import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class AppIconPlayer extends StatelessWidget {
  const AppIconPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              FontAwesomeIcons.solidMoon,
              size: 75,
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: 0,
            top: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                FontAwesomeIcons.music,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppIconBig extends StatelessWidget {
  const AppIconBig({Key key, this.size, this.color}) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.nightlight_round,
        size: size ?? 120,
        color: color ?? Colors.white,
      ),
    );
  }
}

class AppIconPlayerWithSize extends StatelessWidget {
  const AppIconPlayerWithSize({Key key, this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              FontAwesomeIcons.solidMoon,
              size: size,
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 0,
            top: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                FontAwesomeIcons.music,
                size: size / 2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
