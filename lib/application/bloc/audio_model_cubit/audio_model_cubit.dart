import 'package:bloc/bloc.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
part 'audio_model_state.dart';

class AudioModelCubit extends Cubit<AudioModelState> {
  AudioModelCubit()
      : super(AudioModelState(
          currentSong: AudioModel(
            id: "",
            isPlaying: false,
            name: "",
            sourceUrl: "",
          ),
          playlist: [],
        ));

  update({AudioModel currentSong, List<AudioModel> playlist}) =>
      emit(state.copyWith(currentSong: currentSong, playlist: playlist));
}
