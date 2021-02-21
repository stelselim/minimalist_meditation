part of 'audio_model_cubit.dart';

class AudioModelState {
  List<AudioModel> playlist;
  final AudioModel currentSong;
  AudioModelState({
    this.playlist,
    this.currentSong,
  });

  int get playerIndex {
    int index = 0;
    try {
      for (int i = 0; i < playlist.length; i++) {
        if (currentSong.sourceUrl == playlist.elementAt(i).sourceUrl) {
          index = i;
        }
      }
    } catch (e) {
      print(e);
    }
    return index;
  }

  AudioModelState copyWith({
    List<AudioModel> playlist,
    AudioModel currentSong,
  }) {
    return AudioModelState(
      playlist: playlist ?? this.playlist,
      currentSong: currentSong ?? this.currentSong,
    );
  }
}
