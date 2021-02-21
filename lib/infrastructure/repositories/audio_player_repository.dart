import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditate/application/bloc/currently_playing/audio_model_cubit.dart';
import 'package:meditate/application/service_locator.dart';

import 'package:meditate/domain/audio_player.dart';
import 'package:meditate/infrastructure/dummy_data.dart';
import 'package:meditate/presentation/utility/listentime_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioPlayerRepository with AudioPlayerRepositoryModel {
  AudioPlayer audioPlayer;

  AudioPlayerRepository() {
    this.audioPlayer = AudioPlayer();

    audioPlayer.setUrl(audioModel.sourceUrl);
    onPlayerComplete(); // When Finished The Audio
    saveListenTime(); // Save Time IF Playing
    // onSeekComplete(); // When Completing to Seek Function
  }

  clearAllData() async {
    var a = await SharedPreferences.getInstance();
    await a.clear();
  }

  @override
  void next() async {
    var playerAudioModel = getIt<AudioModelCubit>().state;

    // IF Last Element Plays, Come Back To First
    if (playerAudioModel.playerIndex + 1 == playerAudioModel.playlist.length) {
      // Update GET IT

      getIt<AudioModelCubit>().update(
          currentSong: playerAudioModel.playlist.elementAt(0),
          playlist: playerAudioModel.playlist);
      playUrl(playerAudioModel.playlist.elementAt(0).sourceUrl);
    }
    // Play Next
    else {
      // Update GET IT

      var toPlayIndex = playerAudioModel.playerIndex + 1;
      getIt<AudioModelCubit>().update(
          currentSong: playerAudioModel.playlist.elementAt(toPlayIndex),
          playlist: playerAudioModel.playlist);
      playUrl(playerAudioModel.playlist.elementAt(toPlayIndex).sourceUrl);
    }
  }

  @override
  void previous() async {
    var playerAudioModel = getIt<AudioModelCubit>().state;

    // Play Previous
    if (playerAudioModel.playerIndex != 0) {
      // Update GET IT

      var toPlayIndex = playerAudioModel.playerIndex - 1;
      getIt<AudioModelCubit>().update(
          currentSong: playerAudioModel.playlist.elementAt(toPlayIndex),
          playlist: playerAudioModel.playlist);
      playUrl(playerAudioModel.playlist.elementAt(toPlayIndex).sourceUrl);
    }
    // IF First Element,
    else {
      seekTo(Duration(milliseconds: 0));
    }
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
      var playerAudioModel = getIt<AudioModelCubit>().state;
      // IF Last Element Plays, Come Back To First
      if (playerAudioModel.playerIndex + 1 !=
          playerAudioModel.playlist.length) {
        // Update GET IT

        var toPlayIndex = playerAudioModel.playerIndex + 1;
        getIt<AudioModelCubit>().update(
            currentSong: playerAudioModel.playlist.elementAt(toPlayIndex),
            playlist: playerAudioModel.playlist);
        playUrl(playerAudioModel.playlist.elementAt(toPlayIndex).sourceUrl);
      }
    });
  }

  // For Listen Time Saving
  @override
  void saveListenTime() {
    Timer timer;

    audioPlayer.onPlayerStateChanged.listen((event) async {
      if (audioPlayer.state == AudioPlayerState.PLAYING) {
        timer = Timer.periodic(
          Duration(seconds: 2),
          (Timer t) async {
            // print("LİSTEN & SAVE");
            await saveListenTimeToLocal(2);
          },
        );
      }
      if (audioPlayer.state != AudioPlayerState.PLAYING) {
        // print("STOP");
        timer.cancel();
      }
    });
  }

  void onPlayerStateChanged() {
    audioPlayer.onPlayerStateChanged.listen((event) async {
      if (event == AudioPlayerState.PLAYING) {
        var duration = await this.getDuration();
        var time = await this.getCurrentTime();

        audioPlayer.setNotification(
          title: audioModel.name,
          duration: Duration(milliseconds: duration),
          backwardSkipInterval: Duration(seconds: 10),
          forwardSkipInterval: Duration(seconds: 10),
          elapsedTime: Duration(milliseconds: time),
          hasNextTrack: true,
          hasPreviousTrack: true,
        );
      }
    });
  }

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
