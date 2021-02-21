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
    if (duration > time + 10000) {
      await audioPlayerRepository.seekTo(Duration(milliseconds: time + 10000));
    } else {
      await audioPlayerRepository.seekTo(Duration(milliseconds: time + 9000));
    }
  }

  void goBackTenSeconds(AudioPlayerRepository audioPlayerRepository) async {
    var time = await audioPlayerRepository.getCurrentTime();

    if (time > 10000) {
      await audioPlayerRepository.seekTo(Duration(milliseconds: time - 10000));
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
              child: TextButton(
                child: Icon(
                  Icons.skip_previous_rounded,
                  size: iconSize,
                  color: iconColor,
                ),
                onPressed: () {
                  try {
                    previousArrow(audioPlayerRepository);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                child: Icon(
                  Icons.replay_10,
                  size: iconSize,
                  color: iconColor,
                ),
                onPressed: () {
                  try {
                    goBackTenSeconds(audioPlayerRepository);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: BlocBuilder<AudioModelCubit, AudioModelState>(
                builder: (context, state) {
                  return TextButton(
                    child: state.currentSong.isPlaying
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
                      try {
                        playArrow(audioPlayerRepository);
                      } catch (e) {
                        print(e);
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                child: Icon(
                  Icons.forward_10,
                  size: iconSize,
                  color: iconColor,
                ),
                onPressed: () {
                  try {
                    goForwardTenSeconds(audioPlayerRepository);
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                child: Icon(
                  Icons.skip_next_rounded,
                  size: iconSize,
                  color: iconColor,
                ),
                onPressed: () {
                  try {
                    nextArrow();
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
