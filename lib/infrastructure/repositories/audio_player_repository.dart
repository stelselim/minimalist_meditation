import 'package:audioplayers/audioplayers.dart';

import 'package:meditate/domain/audio_player.dart';
import 'package:meditate/infrastructure/dummy_data.dart';

class AudioPlayerRepository with AudioPlayerRepositoryModel {
  AudioPlayer audioPlayer;

  AudioPlayerRepository() {
    this.audioPlayer = AudioPlayer();
    audioPlayer.setUrl(audioModel.sourceUrl);
    onPlayerComplete(); // When Finished The Audio
    // onSeekComplete(); // When Completing to Seek Function
  }

  @override
  void onSeekComplete() {
    audioPlayer.onSeekComplete.listen((event) async {
      await audioPlayer.resume();
    });
  }

  @override
  void onPlayerComplete() {
    audioPlayer.onPlayerCompletion.listen((event) async {
      // print("HEYYY");
      await audioPlayer.seek(Duration(milliseconds: 0));
      await audioPlayer.resume();
    });
  }

  // For Progress Bar
  void onAudioPositionChange() {
    audioPlayer.onAudioPositionChanged.listen((event) async {
      // print("HEYYY");
      await audioPlayer.seek(Duration(milliseconds: 0));
      await audioPlayer.resume();
    });
  }

  // void onPlayerStateChanged() {
  //   audioPlayer.onPlayerStateChanged.listen((event) async {
  //     if (event == AudioPlayerState.PLAYING) {
  //       var duration = await this.getDuration();
  //       var time = await this.getCurrentTime();

  //       audioPlayer.setNotification(
  //         title: audioModel.name,
  //         duration: Duration(milliseconds: duration),
  //         backwardSkipInterval: Duration(seconds: 10),
  //         forwardSkipInterval: Duration(seconds: 10),
  //         elapsedTime: Duration(milliseconds: time),
  //         hasNextTrack: true,
  //         hasPreviousTrack: true,
  //       );
  //     }
  //   });
  // }

  @override
  bool isPlaying() =>
      audioPlayer.state != AudioPlayerState.PLAYING ? true : false;

  @override
  void playUrl(String url) async {
    await audioPlayer.play(url);
  }

  @override
  void resume() async {
    await audioPlayer.resume();
  }

  @override
  void pause() async {
    await audioPlayer.pause();
  }

  @override
  void stop() async {
    await audioPlayer.stop();
  }

  @override
  Future<int> getCurrentTime() async {
    var time = await audioPlayer.getCurrentPosition();
    return time;
  }

  @override
  Future<int> getDuration() async {
    var duration = await audioPlayer.getDuration();
    return duration;
  }

  @override
  Future<int> getPercentage() async {
    var time = await audioPlayer.getCurrentPosition();
    var duration = await audioPlayer.getDuration();
    var percentage = (time ~/ duration) * 100.round();
    return percentage;
  }

  @override
  // In milliseconds
  Future<int> seekTo(Duration position) async {
    var response = await audioPlayer.seek(position);
    return response;
  }
}
// Play URL
// Resume
// Pause

// Stop
// Seek
// Set Playback Rate

// Get Current Position
// Get Duration
// Get Percentage
