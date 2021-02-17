import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audipplayer/audioplayer_bloc.dart';
import 'package:meditate/infrastructure/dummy_data.dart';
import 'package:meditate/infrastructure/repositories/audio_player_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static final audioPlayerRepository = AudioPlayerRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioplayerBloc, AudioplayerState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  audioPlayerRepository.audioPlayer.playerId,
                  textScaleFactor: 2,
                ),
              ),
              Container(
                child: Text("HOME"),
              ),
              TextButton(
                child: Text("PLAY"),
                onPressed: () {
                  var url = audioModel.sourceUrl;
                  audioPlayerRepository.playUrl(url);
                },
              ),
              TextButton(
                child: Text("PAUSE"),
                onPressed: () {
                  audioPlayerRepository.pause();
                },
              ),
              TextButton(
                child: Text("Set Notification Bar"),
                onPressed: () async {
                  try {
                    await audioPlayerRepository.audioPlayer
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
                    print(await audioPlayerRepository.getPercentage());
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
