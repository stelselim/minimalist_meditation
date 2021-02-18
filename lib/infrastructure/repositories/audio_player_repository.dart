import 'package:audioplayers/audioplayers.dart';
import 'package:meditate/domain/audio_player.dart';

class AudioPlayerRepository with AudioPlayerRepositoryModel {
  AudioPlayer audioPlayer;
  AudioPlayerRepository() {
    this.audioPlayer = AudioPlayer();
    onPlayerComplete(); // When Finished The Audio
    onSeekComplete(); // When Completing to Seek Function
  }
  void onSeekComplete() {
    audioPlayer.onSeekComplete.listen((event) async {
      // print("SETTT");
      await audioPlayer.resume();
    });
  }

  void onPlayerComplete() {
    audioPlayer.onPlayerCompletion.listen((event) async {
      // print("HEYYY");
      await audioPlayer.seek(Duration(milliseconds: 0));
      await audioPlayer.resume();
    });
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

  @override
  Future<double> getPercentage() async {
    var time = await audioPlayer.getCurrentPosition();
    var duration = await audioPlayer.getDuration();
    var percentage = (time / duration) * 100.roundToDouble();
    return percentage;
  }

  @override
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
