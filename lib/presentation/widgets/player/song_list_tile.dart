import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/application/bloc/currently_playing/audio_model_cubit.dart';
import 'package:meditate/application/service_locator.dart';
import 'package:meditate/infrastructure/dummy_data.dart';
import 'package:meditate/infrastructure/model/audioplayer_model.dart';
import 'package:meditate/infrastructure/model/category_model.dart';
import 'package:meditate/infrastructure/repositories/audio_player_repository.dart';

class SongListTile extends StatelessWidget {
  const SongListTile(
      {Key key, @required this.audioModel, @required this.categoryModel})
      : super(key: key);

  final AudioModel audioModel;
  final CategoryModel categoryModel;

  static final titleStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  static final subtitleStyle = TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  playThisSongSaveBlocAndSetNotification(BuildContext context) {
    try {
      // Update Get It
      getIt<AudioModelCubit>().update(
        currentSong: audioModel,
        playlist: categoryModel.categoryAudioList,
      );
      BlocProvider.of<AudioplayerCubit>(context)
          .audioPlayerRepository
          .playUrl(audioModel.sourceUrl);

      Navigator.pop(context);
      Navigator.pushNamed(context, "/player");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => playThisSongSaveBlocAndSetNotification(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: category2.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  audioModel.name,
                  style: titleStyle,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  audioModel.artist.toString(),
                  style: subtitleStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
