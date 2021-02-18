import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/infrastructure/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioplayerCubit, AudioplayerState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  state.audioPlayerRepository.audioPlayer.playerId,
                  textScaleFactor: 2,
                ),
              ),
              Container(
                child: Text("HOME"),
              ),
              TextButton(
                child: Text("PLAY"),
                onPressed: () async {
                  try {
                    var url = audioModel.sourceUrl;
                    state.audioPlayerRepository.playUrl(url);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              TextButton(
                child: Text("Resume"),
                onPressed: () {
                  state.audioPlayerRepository.resume();
                },
              ),
              TextButton(
                child: Text("PAUSE"),
                onPressed: () {
                  state.audioPlayerRepository.pause();
                },
              ),
              TextButton(
                child: Text("Set Notification Bar"),
                onPressed: () async {
                  try {
                    await state.audioPlayerRepository.audioPlayer
                        .setNotification(title: "HEY THERE", artist: "get");
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              TextButton(
                child: Text("Print Percentage"),
                onPressed: () async {
                  try {
                    print(await state.audioPlayerRepository.getPercentage());
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              TextButton(
                child: Text("Print Duration & Time"),
                onPressed: () async {
                  try {
                    dynamic currentTime =
                        await state.audioPlayerRepository.getCurrentTime();
                    currentTime = Duration(milliseconds: currentTime).inSeconds;
                    print("Current Time: " + currentTime.toString());
                    dynamic duration =
                        await state.audioPlayerRepository.getDuration();
                    duration = Duration(milliseconds: duration).inSeconds;
                    print("Duration Time: " + duration.toString());
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              TextButton(
                child: Text("Seek To last 20 secs."),
                onPressed: () async {
                  try {
                    dynamic duration =
                        await state.audioPlayerRepository.getDuration();
                    Duration _duration = // minus 20 seconds
                        Duration(milliseconds: duration - 10000);
                    await state.audioPlayerRepository.seekTo(_duration);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
