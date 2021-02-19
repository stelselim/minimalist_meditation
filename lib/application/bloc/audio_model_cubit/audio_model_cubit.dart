import 'package:bloc/bloc.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
part 'audio_model_state.dart';

class AudioModelCubit extends Cubit<AudioModelState> {
  AudioModelCubit()
      : super(AudioModelState(
            audioModel: AudioModel(
          id: "",
          isPlaying: false,
          name: "",
          sourceUrl: "",
        )));

  update(AudioModel audioModel) => emit(state.copyWith(audioModel: audioModel));
}
