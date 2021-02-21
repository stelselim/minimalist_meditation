import 'package:flutter/material.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/presentation/utility/go_playlist.dart';

class SmallMoodCard extends StatelessWidget {
  const SmallMoodCard(
      {Key key, @required this.playlist, @required this.imagePath})
      : super(key: key);

  final CategoryModel playlist;
  final String imagePath;
  static const backgroundColor = Color.fromRGBO(255, 255, 255, 0.9);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToPlaylistPage(
          context: context,
          playlist: playlist,
        );
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(
              imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
