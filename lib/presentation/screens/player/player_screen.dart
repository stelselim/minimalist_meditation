import 'package:flutter/material.dart';
import 'package:meditate/presentation/widgets/general/app_icon.dart';
import 'package:meditate/presentation/widgets/player/bottom_bar.dart';
import 'package:meditate/presentation/widgets/player/player_avatar.dart';
import 'package:meditate/presentation/widgets/player/player_controllers.dart';
import 'package:meditate/presentation/widgets/player/progress_bar.dart';
import 'package:meditate/presentation/widgets/player/song_title.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 51, 52, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: AppIconPlayer(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Expanded(
              flex: 5,
              child: PlayerAvatar(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: SongTitle(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: ProgressBar(),
            ),
            Expanded(
              flex: 2,
              child: PlayerControllers(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: BottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
