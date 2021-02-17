import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerRepositoryModel {
  void playUrl(String url);

  void resume();

  void pause();

  void stop();

  Future<int> getDuration();

  Future<int> getCurrentTime();

  Future<double> getPercentage();
}

class AudioPlayerRepository with AudioPlayerRepositoryModel {
  AudioPlayer audioPlayer;
  AudioPlayerRepository() {
    this.audioPlayer = AudioPlayer();
  }

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

  Future<double> getPercentage() async {
    var time = await audioPlayer.getCurrentPosition();
    var duration = await audioPlayer.getDuration();
    var percentage = (time / duration) * 100.roundToDouble();
    return percentage;
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
