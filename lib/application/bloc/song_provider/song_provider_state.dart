part of 'song_provider_cubit.dart';

@immutable
abstract class SongProviderState {
  final AudioModel audioModel;
  SongProviderState({
    this.audioModel,
  });
}

class SongProviderInitial extends SongProviderState {
  final AudioModel audioModel;
  SongProviderInitial({@required this.audioModel});
}
