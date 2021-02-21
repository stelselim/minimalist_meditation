import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/playlist_provider/music_provider_bloc.dart';
import 'package:meditate/constant/styles/color.dart';
import 'package:meditate/presentation/widgets/player/song_list_tile.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        state.playlistFetched.categoryName,
                        textScaleFactor: 2.5,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Image.network(state.playlistFetched.imageUrl),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              state.playlistFetched.categoryAudioList.length,
                          itemBuilder: (context, index) {
                            var element = state
                                .playlistFetched.categoryAudioList
                                .elementAt(index);

                            return SongListTile(
                              audioModel: element,
                              categoryModel: state.playlistFetched,
                            );
                          },
                        ),
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
      ),
    );
  }
}
