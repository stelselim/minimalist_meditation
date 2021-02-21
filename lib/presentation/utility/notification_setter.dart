import 'package:audioplayers/audioplayers.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:meditate/infrastructure/repositories/audio_player_repository.dart';

void setNotificationWithNewSong(
    AudioModel audioModel, AudioPlayerRepository audioPlayerRepository) {
  audioPlayerRepository.audioPlayer.onPlayerStateChanged.listen((event) async {
    if (event == AudioPlayerState.PLAYING) {
      var duration = await audioPlayerRepository.getDuration();
      var time = await audioPlayerRepository.getCurrentTime();

      audioPlayerRepository.audioPlayer.setNotification(
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
