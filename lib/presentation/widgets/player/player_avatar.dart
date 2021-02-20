import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        maxRadius: MediaQuery.of(context).size.width * 0.5,
        child: Text("Simple Meditation"),
      ),
    );
  }
}

class PlayerAvatarWithNetworkImage extends StatelessWidget {
  const PlayerAvatarWithNetworkImage({Key key, this.imageUrl})
      : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        maxRadius: MediaQuery.of(context).size.width * 0.3,
        backgroundImage: CachedNetworkImageProvider(
          imageUrl,
        ),
      ),
    );
  }
}
