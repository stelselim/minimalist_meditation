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

final audioModel = AudioModel(
  id: "blank-space",
  isPlaying: false,
  name: "Taylor Swift - Blank Space",
  sourceUrl: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
);
