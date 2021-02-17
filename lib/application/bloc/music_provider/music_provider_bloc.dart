import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meta/meta.dart';

part 'music_provider_event.dart';
part 'music_provider_state.dart';

class MusicProviderBloc extends Bloc<MusicProviderEvent, MusicProviderState> {
  MusicProviderBloc() : super(PlaylistUnitiliazed());

  @override
  Stream<MusicProviderState> mapEventToState(
    MusicProviderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}