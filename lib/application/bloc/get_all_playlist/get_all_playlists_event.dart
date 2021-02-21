part of 'get_all_playlists_bloc.dart';

abstract class GetAllPlaylistsEvent extends Equatable {
  const GetAllPlaylistsEvent();

  @override
  List<Object> get props => [];
}

class GetAllPlaylists extends GetAllPlaylistsEvent {}
