import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/infrastructure/dummy_data.dart';
import 'package:meditate/infrastructure/repositories/audio_player_repository.dart';

class PlayerControllers extends StatelessWidget {
  const PlayerControllers({Key key}) : super(key: key);

  static const iconSize = 45.0;
  static const iconColor = Color.fromRGBO(233, 242, 242, 1);

  goForwardTenSeconds() {}
  goBackTenSeconds() {}
  playArrow(AudioPlayerRepository audioPlayerRepository) {
    if (audioPlayerRepository.audioPlayer.state == AudioPlayerState.PLAYING) {
      audioPlayerRepository.audioPlayer.pause();
    } else {
      audioPlayerRepository.audioPlayer.resume();
    }
  }

  nextArrow() {}
  previousArrow() {}

  @override
  Widget build(BuildContext context) {
    final audioPlayerRepository =
        BlocProvider.of<AudioplayerCubit>(context).audioPlayerRepository;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.skip_previous_rounded,
                  size: iconSize,
                  color: iconColor,
                ),
                onPressed: () => {},
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                  icon: Icon(
                    Icons.replay_10,
                    size: iconSize,
                    color: iconColor,
                  ),
                  onPressed: () => {}),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.play_circle_fill,
                  size: iconSize,
                  color: iconColor,
                ),
                onPressed: () => playArrow(audioPlayerRepository),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                  icon: Icon(
                    Icons.forward_10,
                    size: iconSize,
                    color: iconColor,
                  ),
                  onPressed: () {}),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: IconButton(
                  icon: Icon(
                    Icons.skip_next_rounded,
                    size: iconSize,
                    color: iconColor,
                  ),
                  onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
