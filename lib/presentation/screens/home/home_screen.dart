import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/music_provider/music_provider_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicProviderBloc, MusicProviderState>(
      builder: (context, state) {
        if (state is PlaylistFetched) {
          final weather = state.playlistFetched;
          print(weather);
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
              ],
            ),
          );
        }
        if (state is PlaylistFetching) {
          return CircularProgressIndicator();
        }

        return Center(
          child: Column(
            children: [
              Container(
                child: Text("HOME"),
              ),
              FlatButton(
                  onPressed: () {
                    BlocProvider.of<MusicProviderBloc>(context)
                        .add(CategorySelected(categoryId: "categoryId"));
                  },
                  child: Text("HEy")),
            ],
          ),
        );
      },
    );
  }
}
