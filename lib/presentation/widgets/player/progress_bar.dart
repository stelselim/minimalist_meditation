import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key key}) : super(key: key);

  static final timeTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500);

  double percentage(Duration current, int duration) {
    int durationInMilliseconds = duration;
    double percentage = 100 * current.inMilliseconds / durationInMilliseconds;

    // print("Current Time " + current.inSeconds.toString());
    // print("Total DUration " + (duration / 1000).toString());
    // print(percentage);

    return percentage;
  }

  String currentTime(Duration duration) {
    if (duration.inSeconds % 60 < 10) {
      return duration.inMinutes.toString() +
          ":0" +
          (duration.inSeconds % 60).toString();
    } else {
      return duration.inMinutes.toString() +
          ":" +
          (duration.inSeconds % 60).toString();
    }
  }

  String lastTime(Duration duration) {
    if (duration.inSeconds % 60 < 10) {
      return duration.inMinutes.toString() +
          ":0" +
          (duration.inSeconds % 60).toString();
    } else {
      return duration.inMinutes.toString() +
          ":" +
          (duration.inSeconds % 60).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioplayerCubit, AudioplayerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: FutureBuilder<List<int>>(
                future: Future.wait([
                  state.audioPlayerRepository.getDuration(),
                  state.audioPlayerRepository.getCurrentTime(),
                  state.audioPlayerRepository.getPercentage(),
                ]),
                builder: (context, audioDuration) {
                  if (audioDuration == null || audioDuration.data == null) {
                    return Container();
                  }
                  return StreamBuilder<Duration>(
                    stream: state.audioPlayerRepository.audioPlayer
                        .onAudioPositionChanged,
                    builder: (context, snapshot) {
                      if (snapshot == null || snapshot.data == null) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Slider(
                              max: 100.0,
                              min: 0.0,
                              value: percentage(
                                Duration(
                                    milliseconds: audioDuration
                                        .data[1]), // LAST CURRENT TIME
                                audioDuration.data.first, // AUDIO DURATION
                              ),
                              onChanged: (percent) {
                                var changePercent =
                                    audioDuration.data.first * percent / 100;
                                state.audioPlayerRepository.seekTo(Duration(
                                    milliseconds: changePercent.toInt()));
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  currentTime(
                                    Duration(
                                        milliseconds: audioDuration
                                            .data[1]), // GET CURRENT TIME
                                  ),
                                  style: timeTextStyle,
                                ),
                                Text(
                                  lastTime(Duration(
                                          milliseconds: audioDuration
                                              .data[0]) // GET TOTAL TIME
                                      ),
                                  style: timeTextStyle,
                                ),
                              ],
                            ),
                          ],
                        );
                      }

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Slider(
                            max: 100.0,
                            min: 0.0,
                            value: percentage(
                              snapshot.data,
                              audioDuration.data.first,
                            ),
                            onChanged: (percent) {
                              var changePercent =
                                  audioDuration.data.first * percent / 100;
                              state.audioPlayerRepository.seekTo(Duration(
                                  milliseconds: changePercent.toInt()));
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentTime(snapshot.data),
                                style: timeTextStyle,
                              ),
                              Text(
                                lastTime(Duration(
                                    milliseconds: audioDuration.data.first)),
                                style: timeTextStyle,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
