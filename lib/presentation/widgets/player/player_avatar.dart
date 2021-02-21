import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        maxRadius: MediaQuery.of(context).size.width * 0.5,
        child: PlayerAvatarWithNetworkImage(
          imageUrl:
              "https://s3-alpha-sig.figma.com/img/6890/1ac9/66f911e5ee11b99b7b3afe3aaa855c16?Expires=1614556800&Signature=AqL81jOtfH-~SradnqtYgrIsZI1ehTEzCQJE4Rp1pTwudv49Xb~aWaJXA7~V3x50l350Q4tGZVMJNyw2GRXXeaL0VruA-C8YIrovjMmh58QSjtFTS3o7Bv7NlB~qXgxStFGWed-iT2W3JV2B9Giu786BkY~G5z7MblJVLugWc--ZC~76oxGUAxjFj3-ZZNi~YTusfpMZ9iKUhkpStAPkDiErSr8A3D7QECL2poMsIl-gQ2kcrQbs-w4EEtP3izXJmmdqEpZy8sqb0Z4Bd1FlCvgwQPTGudyrbgRGdTzOyS5Ppo3v8xEBEpuZmD0eJWRXQcGByxMvn8Xv4PvT7HNzbA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
        ),
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
