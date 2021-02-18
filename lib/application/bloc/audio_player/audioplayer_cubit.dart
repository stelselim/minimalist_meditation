import 'package:bloc/bloc.dart';
import 'package:meditate/infrastructure/repositories/audio_player_repository.dart';
import 'package:meta/meta.dart';

part 'audioplayer_state.dart';

class AudioplayerCubit extends Cubit<AudioplayerState> {
  AudioplayerCubit() : super(AudioplayerInitial());

  AudioPlayerRepository get audioPlayerRepository =>
      state.audioPlayerRepository;

  // To Update AudioPlayerRepository
  update() => emit(state);
}
