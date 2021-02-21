import 'model/audioplayer_model.dart';
import 'model/category_model.dart';

final category2 = CategoryModel(
  categoryAudioList: [
    AudioModel(
      id: "blank-space",
      isPlaying: false,
      name: "Taylor Swift - Blank Space",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    ),
    AudioModel(
      id: "Second",
      isPlaying: false,
      name: "No Name",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3",
    )
  ],
  imageUrl:
      "https://hips.hearstapps.com/ell.h-cdn.co/assets/cm/15/02/640x426/54abb224c5bd7_-_elle-taylor-blank-space-lgn.jpg?resize=480:*",
  categoryName: "blank space",
  id: "taylor-swift",
);

final categoriesList = [
  category2,
  category2,
  category2,
  category2,
  category2,
  category2,
];

final audioModel = AudioModel(
  id: "blank-space",
  isPlaying: false,
  name: "Taylor Swift - Blank Space",
  sourceUrl: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
);

const playerImage =
    "https://s3-alpha-sig.figma.com/img/6890/1ac9/66f911e5ee11b99b7b3afe3aaa855c16?Expires=1614556800&Signature=AqL81jOtfH-~SradnqtYgrIsZI1ehTEzCQJE4Rp1pTwudv49Xb~aWaJXA7~V3x50l350Q4tGZVMJNyw2GRXXeaL0VruA-C8YIrovjMmh58QSjtFTS3o7Bv7NlB~qXgxStFGWed-iT2W3JV2B9Giu786BkY~G5z7MblJVLugWc--ZC~76oxGUAxjFj3-ZZNi~YTusfpMZ9iKUhkpStAPkDiErSr8A3D7QECL2poMsIl-gQ2kcrQbs-w4EEtP3izXJmmdqEpZy8sqb0Z4Bd1FlCvgwQPTGudyrbgRGdTzOyS5Ppo3v8xEBEpuZmD0eJWRXQcGByxMvn8Xv4PvT7HNzbA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
