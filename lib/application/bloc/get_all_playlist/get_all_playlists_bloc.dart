import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/infrastructure/repositories/music_provider_repository.dart';

part 'get_all_playlists_event.dart';
part 'get_all_playlists_state.dart';

class GetAllPlaylistsBloc
    extends Bloc<GetAllPlaylistsEvent, GetAllPlaylistsState> {
  final MusicProviderRepository musicProviderRepository;

  GetAllPlaylistsBloc(this.musicProviderRepository)
      : super(AllPlaylistUnitiliazed());

  @override
  Stream<GetAllPlaylistsState> mapEventToState(
    GetAllPlaylistsEvent event,
  ) async* {
    yield AllPlaylistFetchingState();
    List<CategoryModel> categoryList;

    try {
      if (event is GetAllPlaylists) {
        categoryList = await musicProviderRepository.getAllCategories();
      }

      if (categoryList.isEmpty) {
        yield AllPlaylistEmptyState();
      } else {
        yield AllPlaylistFetchedState(categoryList);
      }
    } catch (e) {
      print("error occured in Bloc");
      yield AllPlaylistErrorState(error: e);
    }
  }
}
