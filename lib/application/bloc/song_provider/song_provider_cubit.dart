import 'package:bloc/bloc.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:meditate/infrastructure/repositories/music_provider_repository.dart';
import 'package:meta/meta.dart';
part 'song_provider_state.dart';

class SongProviderCubit extends Cubit<SongProviderState> {
  MusicProviderRepository musicProviderRepository;

  SongProviderCubit(this.musicProviderRepository)
      : super(SongProviderInitial(audioModel: null));

  bool hasGotMusic() => state.audioModel != null ? true : false;

  void getMusicById(String id) async {
    var model = await musicProviderRepository.getById(id);
    print(model);
    emit(
      SongProviderInitial(
        audioModel: model,
      ),
    );
  }
}
