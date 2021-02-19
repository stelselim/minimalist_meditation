part of 'audioplayer_cubit.dart';

@immutable
abstract class AudioplayerState {
  final AudioPlayerRepository audioPlayerRepository;
  AudioplayerState({
    this.audioPlayerRepository,
  });
}

class AudioplayerInitial extends AudioplayerState {
  final AudioPlayerRepository audioPlayerRepository;
  AudioplayerInitial() : audioPlayerRepository = AudioPlayerRepository();
}

class AudioplayerWithNewState extends AudioplayerState {
  final AudioPlayerRepository audioPlayerRepository;
  AudioplayerWithNewState(this.audioPlayerRepository);
}
