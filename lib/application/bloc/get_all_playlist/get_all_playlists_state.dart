part of 'get_all_playlists_bloc.dart';

abstract class GetAllPlaylistsState extends Equatable {
  const GetAllPlaylistsState();

  @override
  List<Object> get props => [];
}

class AllPlaylistUnitiliazed extends GetAllPlaylistsState {
  AllPlaylistUnitiliazed() : super();
}

class AllPlaylistFetchingState extends GetAllPlaylistsState {
  AllPlaylistFetchingState() : super();
}

class AllPlaylistFetchedState extends GetAllPlaylistsState {
  final List<CategoryModel> categoryList;
  AllPlaylistFetchedState(this.categoryList) : super();
}

class AllPlaylistEmptyState extends GetAllPlaylistsState {
  AllPlaylistEmptyState() : super();
}

class AllPlaylistErrorState extends GetAllPlaylistsState {
  final String error;
  AllPlaylistErrorState({@required this.error}) : super();
}
