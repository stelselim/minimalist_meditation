part of 'music_provider_bloc.dart';

@immutable
abstract class MusicProviderState {}

class PlaylistUnitiliazed extends MusicProviderState {}

class PlaylistFetching extends MusicProviderState {}

class PlaylistFetched extends MusicProviderState {
  final CategoryModel playlistFetched;
  PlaylistFetched({
    @required this.playlistFetched,
  });
}

class PlaylistErrorState extends MusicProviderState {
  final String error;
  PlaylistErrorState({
    @required this.error,
  });
}

class PlaylistEmptyState extends MusicProviderState {}
