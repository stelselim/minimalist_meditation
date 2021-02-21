import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/playlist_provider/music_provider_bloc.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<MusicProviderBloc, MusicProviderState>(
          builder: (context, state) {
            if (state is PlaylistUnitiliazed) {
              Navigator.pop(context);
              return CircularProgressIndicator();
            }
            if (state is PlaylistFetching) {
              return CircularProgressIndicator();
            }

            if (state is PlaylistErrorState) {
              Fluttertoast.showToast(msg: "An Error Occured");
              return Container(
                child: Text("An Error Occured"),
              );
            }

            if (state is PlaylistEmptyState) {
              return Center(
                child: Text("Categories not found!"),
              );
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

            return Container(
              child: Text("An Error Occured"),
            );
          },
        ),
      ),
    );
  }
}
