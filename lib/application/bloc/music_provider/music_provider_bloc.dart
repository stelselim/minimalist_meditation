import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/infrastructure/repositories/music_provider_repository.dart';
import 'package:meta/meta.dart';

part 'music_provider_event.dart';
part 'music_provider_state.dart';

class MusicProviderBloc extends Bloc<MusicProviderEvent, MusicProviderState> {
  final MusicProviderRepository musicProviderRepository;

  MusicProviderBloc(this.musicProviderRepository)
      : assert(musicProviderRepository != null),
        super(PlaylistUnitiliazed());

  @override
  void onTransition(
      Transition<MusicProviderEvent, MusicProviderState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<MusicProviderState> mapEventToState(
    MusicProviderEvent event,
  ) async* {
    yield PlaylistFetching();

    CategoryModel categoryModel;

    try {
      if (event is CategorySelected) {
        categoryModel =
            await musicProviderRepository.getCategory(event.categoryId);
      } else if (event is MoodSelected) {
        categoryModel =
            await musicProviderRepository.getCategoryByMood(event.mood);
      } else if (categoryModel.categoryAudioList != null) {
        yield PlaylistEmptyState();
      } else {
        yield PlaylistFetched(playlistFetched: categoryModel);
      }
    } catch (e) {
      yield PlaylistErrorState(error: e.toString());
    }
  }
}
