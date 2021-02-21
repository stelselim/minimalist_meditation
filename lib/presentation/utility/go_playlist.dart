import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/playlist_provider/music_provider_bloc.dart';
import 'package:meditate/infrastructure/model/category_model.dart';

void goToPlaylistPage({
  @required BuildContext context,
  @required CategoryModel playlist,
}) {
  try {
    BlocProvider.of<MusicProviderBloc>(context).add(
      SetPlaylist(categoryModel: playlist),
    );
    Navigator.pushNamed(context, "/playlist");
  } catch (e) {
    Fluttertoast.showToast(msg: "An Error Occured" + e);
    print(e);
  }
}
