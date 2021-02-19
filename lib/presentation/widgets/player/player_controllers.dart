import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_model_cubit/audio_model_cubit.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/infrastructure/repositories/audio_player_repository.dart';

class PlayerControllers extends StatelessWidget {
  const PlayerControllers({Key key}) : super(key: key);

  static const iconSize = 45.0;
  static const iconColor = Color.fromRGBO(233, 242, 242, 1);

  void goForwardTenSeconds(AudioPlayerRepository audioPlayerRepository) async {
    var time = await audioPlayerRepository.getCurrentTime();
    var duration = await audioPlayerRepository.getDuration();
    if (duration > time + 10) {
      await audioPlayerRepository.seekTo(Duration(milliseconds: time + 10));
    } else {
      await audioPlayerRepository.seekTo(Duration(milliseconds: time + 9));
    }
  }

  void goBackTenSeconds(AudioPlayerRepository audioPlayerRepository) async {
    var time = await audioPlayerRepository.getCurrentTime();

    if (time > 10) {
      await audioPlayerRepository.seekTo(Duration(milliseconds: time - 10));
    } else {
      await audioPlayerRepository.seekTo(Duration(milliseconds: 0));
    }
  }

  void playArrow(AudioPlayerRepository audioPlayerRepository) {
    if (audioPlayerRepository.audioPlayer.state == AudioPlayerState.PLAYING) {
      audioPlayerRepository.audioPlayer.pause();
    } else {
      audioPlayerRepository.audioPlayer.resume();
    }
  }

  void previousArrow(AudioPlayerRepository audioPlayerRepository) async {
    var time = await audioPlayerRepository.getCurrentTime();

    if (time > 7) {
      await audioPlayerRepository.seekTo(Duration(milliseconds: 0));
    } else {
      // await audioPlayerRepository.previous();
    }
  }

  void nextArrow() async {
    // await audioPlayerRepository.next();
  }

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
                onPressed: () => previousArrow(audioPlayerRepository),
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
                onPressed: () => goBackTenSeconds(audioPlayerRepository),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: BlocBuilder<AudioModelCubit, AudioModelState>(
                builder: (context, state) {
                  return IconButton(
                    icon: state.audioModel.isPlaying
                        ? Icon(
                            Icons.pause_circle_filled,
                            size: iconSize,
                            color: iconColor,
                          )
                        : Icon(
                            Icons.play_circle_fill,
                            size: iconSize,
                            color: iconColor,
                          ),
                    onPressed: () {
                      playArrow(audioPlayerRepository);
                      BlocProvider.of<AudioModelCubit>(context).update(
                        state.audioModel
                            .copyWith(isPlaying: !state.audioModel.isPlaying),
                      );
                    },
                  );
                },
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
                onPressed: () => goForwardTenSeconds(audioPlayerRepository),
              ),
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
                onPressed: () => nextArrow(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
