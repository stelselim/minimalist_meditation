import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/get_all_playlist/get_all_playlists_bloc.dart';
import 'package:meditate/application/bloc/playlist_provider/music_provider_bloc.dart';
import 'package:meditate/presentation/utility/go_playlist.dart';
import 'package:meditate/presentation/widgets/categories/category_card.dart';
import 'package:meditate/presentation/widgets/categories/category_text.dart';
import 'package:meditate/presentation/widgets/general/header_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CategoryText(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
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
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: state.categoryList.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        onPressFunction: () => goToPlaylistPage(
                          context: context,
                          playlist: state.categoryList.elementAt(index),
                        ),
                        categoryModel: state.categoryList.elementAt(index),
                      );
                    },
                  ),
                );
              }

              return Container(
                child: Text("An Error Occured"),
              );
            },
          ),
        ],
      ),
    );
  }
}
