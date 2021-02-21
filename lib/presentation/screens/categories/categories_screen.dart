import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/get_all_playlist/get_all_playlists_bloc.dart';
import 'package:meditate/presentation/widgets/general/header_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBar(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        BlocBuilder<GetAllPlaylistsBloc, GetAllPlaylistsState>(
          builder: (context, state) {
            if (state is AllPlaylistFetchingState) {
              return CircularProgressIndicator();
            }
            if (state is AllPlaylistUnitiliazed) {
              BlocProvider.of<GetAllPlaylistsBloc>(context)
                  .add(GetAllPlaylists());

              return CircularProgressIndicator();
            }

            if (state is AllPlaylistErrorState) {
              Fluttertoast.showToast(msg: "An Error Occured" + state.error);
              return Container(
                child: Text("An Error Occured"),
              );
            }

            if (state is AllPlaylistEmptyState) {
              return Center(
                child: Text("Categories not found!"),
              );
            }

            if (state is AllPlaylistFetchedState) {
              return Center(
                child: Column(
                  children: [
                    Container(),
                  ],
                ),
              );
            }

            return Container(
              child: Text("An Error Occured"),
            );
          },
        ),
      ],
    );
  }
}
