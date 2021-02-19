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

    for (int i = 0; i < playlist.length; i++) {
      if (currentSong == playlist.elementAt(i)) {
        index = i;
      }
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
