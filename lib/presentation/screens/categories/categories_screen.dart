import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/playlist_provider/music_provider_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicProviderBloc, MusicProviderState>(
      builder: (context, state) {
        if (state is PlaylistFetching) {
          return CircularProgressIndicator();
        }
        if (state is PlaylistFetched) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.playlistFetched.categoryName,
                  textScaleFactor: 2,
                ),
                Text(
                  state.playlistFetched.id,
                  textScaleFactor: 2,
                ),
                Image.network(state.playlistFetched.imageUrl),
                SizedBox(
                  height: 25,
                ),
                Text(
                  state.playlistFetched.categoryAudioList.first.name,
                  textScaleFactor: 2,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  state.playlistFetched.categoryAudioList.elementAt(1).name,
                  textScaleFactor: 2,
                ),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("GET BACK"),
                ),
              ],
            ),
          );
        }

        return Center(
          child: Column(
            children: [
              Container(
                child: Text("HOME"),
              ),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<MusicProviderBloc>(context)
                        .add(CategorySelected(categoryId: "categoryId"));
                  },
                  child: Text("GET LIST")),
            ],
          ),
        );
      },
    );
  }
}
