import 'package:flutter/material.dart';
import 'package:meditate/presentation/widgets/general/app_icon.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 51, 52, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppIcon(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Expanded(
              flex: 4,
              child: CircleAvatar(
                maxRadius: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  child: Text(
                    "SONG NAME\n Artist VS.",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 2,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "PROGRESS BAR",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 2,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "COntrollers",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 2,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Bottom BAR",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
