import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audioplayer_event.dart';
part 'audioplayer_state.dart';

class AudioplayerBloc extends Bloc<AudioplayerEvent, AudioplayerState> {
  AudioplayerBloc() : super(AudioplayerInitial());

  @override
  Stream<AudioplayerState> mapEventToState(
    AudioplayerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
