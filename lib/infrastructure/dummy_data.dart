import 'model/audioplayer_model.dart';
import 'model/category_model.dart';

final category2 = CategoryModel(
  description: "Breathe and Be Okay",
  categoryAudioList: [
    AudioModel(
      artist: "Taylor Swift",
      id: "blank-space",
      isPlaying: false,
      name: "Taylor Swift - Blank Space",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    ),
    AudioModel(
      id: "Second",
      artist: "The Weekend",
      isPlaying: false,
      name: "Starboy",
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
  artist: "Taylor Swift",
  isPlaying: false,
  name: "Blank Space",
  sourceUrl: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
);

const playerImage =
    "https://s3-alpha-sig.figma.com/img/6890/1ac9/66f911e5ee11b99b7b3afe3aaa855c16?Expires=1614556800&Signature=AqL81jOtfH-~SradnqtYgrIsZI1ehTEzCQJE4Rp1pTwudv49Xb~aWaJXA7~V3x50l350Q4tGZVMJNyw2GRXXeaL0VruA-C8YIrovjMmh58QSjtFTS3o7Bv7NlB~qXgxStFGWed-iT2W3JV2B9Giu786BkY~G5z7MblJVLugWc--ZC~76oxGUAxjFj3-ZZNi~YTusfpMZ9iKUhkpStAPkDiErSr8A3D7QECL2poMsIl-gQ2kcrQbs-w4EEtP3izXJmmdqEpZy8sqb0Z4Bd1FlCvgwQPTGudyrbgRGdTzOyS5Ppo3v8xEBEpuZmD0eJWRXQcGByxMvn8Xv4PvT7HNzbA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";

final homeMeditation101 = CategoryModel(
  categoryName: "Meditation 101",
  id: "meditation-101",
  description: "Techniques, Benefits, and a Beginner’s How-To",
  categoryAudioList: [
    AudioModel(
      artist: "Painting Forest",
      id: "blank-space",
      isPlaying: false,
      name: "Taylor Swift - Blank Space",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    ),
    AudioModel(
      artist: "The Weekend",
      id: "Second",
      isPlaying: false,
      name: "StarBoy",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3",
    )
  ],
  imageUrl:
      "https://s3-alpha-sig.figma.com/img/09ca/f098/29360a5494194517137564a3788350f3?Expires=1614556800&Signature=F-PYtK5xQ1-xV-SdImHotwYrSk-YJe4Iz5C2OPeho9jUIIw~HyLt08nQHaVfvmc-Bh4jc2MLmyb-wYLzE-4EDs2q58K260nNSqCbctTP2C~rF6hnWMORG2tRb7AiRMZapKLf~lkALaDfxmnF2GUNg1jSUAPFIUWfxEYLQrWg4AEEVmHvTJjWzZ-8s0vNeDFAzozBaI3K57nHhhFqx34phXIXAn-13KMhhzL7EA6s4UbkT83gwX6g2xM~8I9X7vs~qP-ipsfXGTd2UPil55GTVpC1oYlHGnOmWTFV5G9npGNlWuKBel3chMv8dgG8NN7GwVatBjUNd4eJ8yEabW57-Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
);

final homeCardio = CategoryModel(
  categoryName: "Cardio Meditation",
  id: "cardio-meditation",
  description: "Breathe and Be Okay",
  categoryAudioList: [
    AudioModel(
      artist: "Taylor Swift",
      id: "blank-space",
      isPlaying: false,
      name: "Blank Space",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    ),
    AudioModel(
      id: "Second",
      artist: "The Weekend",
      isPlaying: false,
      name: "Starboy",
      sourceUrl:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3",
    )
  ],
  imageUrl:
      "https://s3-alpha-sig.figma.com/img/44d8/dbdc/05b3e6c2c95ba482a77a44c1eef5f76a?Expires=1614556800&Signature=Ka64xDXF8oukjU5K5X-BvbTdCiaDR7y2UXlwYLACMX1t85O8Grl91BrsZSahKe40RhsnxJoWacB2WkZ3jifMDUcLt5b5VOtYsIgaCwzuvBrrSu7MWmLBBhCDjG95~7aqBYT3MgK9OMYAxc~SKxxE~yD-zft2-rLj3T7TlSuHq~LHLwVK5atSk60sYd7Iv-6U1NyVEbmOdszdrlqxREyvypK-l7Uuxlv9W4MqxSaMb~6~yI7oDH5qIeSwHuDp~IoXey3piefZz9StbBRsUFI2iz1MdR1GyWS4sHBDHf8Au~tjUO3c6tGARw8Xd~GnREy88T6THkynhmJfvPdQ2SWetg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
);

final anxiousList = category2;
final calmList = category2;
final relaxList = category2;
final focusList = category2;

final categoriesList = [
  category2.copyWith(
    imageUrl:
        "https://s3-alpha-sig.figma.com/img/6890/1ac9/66f911e5ee11b99b7b3afe3aaa855c16?Expires=1614556800&Signature=AqL81jOtfH-~SradnqtYgrIsZI1ehTEzCQJE4Rp1pTwudv49Xb~aWaJXA7~V3x50l350Q4tGZVMJNyw2GRXXeaL0VruA-C8YIrovjMmh58QSjtFTS3o7Bv7NlB~qXgxStFGWed-iT2W3JV2B9Giu786BkY~G5z7MblJVLugWc--ZC~76oxGUAxjFj3-ZZNi~YTusfpMZ9iKUhkpStAPkDiErSr8A3D7QECL2poMsIl-gQ2kcrQbs-w4EEtP3izXJmmdqEpZy8sqb0Z4Bd1FlCvgwQPTGudyrbgRGdTzOyS5Ppo3v8xEBEpuZmD0eJWRXQcGByxMvn8Xv4PvT7HNzbA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    categoryName: "Mood Journal",
  ),
  category2.copyWith(
      imageUrl:
          "https://s3-alpha-sig.figma.com/img/f672/5547/e57849a06aa896d0f171bdbd88d6e52e?Expires=1614556800&Signature=abXcxgHVvcz0p5UgboEwXsBCknhaSoEi2UNdON0-k8PsJ7CdTBHF5~lIdyVSk46~qsBI27zLTdZYMFTbvDB3wTeYed5JnGspUXI~Qdv8LTfAgPa0uLEOdLrzxxc~GvDUGCJ7~VRlN3p~EBZvz3V-NEj-T9XD9p5-O~0jD0YAkqq9ns-n8~JjXKqV58A43ZSiX24Ecanw6E15x5OXbZJAi-bH63zwP9KpwFdf21KeSIF76ZYWnBn7j6STxdbEWV2cJMY3aYXNuZpcHfdZZEXOmlH13JkA7xiwAAWm~6lgJCZ4~AN7aXhxqvACL6m8NYNxEhk8e21un2uzpWK7xPqHlw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
      categoryName: "Mood Booster"),
  category2.copyWith(
    categoryName: "Positive Notes",
    imageUrl:
        "https://s3-alpha-sig.figma.com/img/3574/edec/ca96b3e4e740f2e3d1c83d0c689cc3e4?Expires=1614556800&Signature=SjDr2k7WYv0gLwyuqUYG08uOwklMQFm8~tT8-yW39AM6savPsVjLZI3UiM7tzv8WnJa9K6snXwETJhNBLpmCHxxa1CeIEOcbtGRKmt0a92dS3QMbpY7tdJsGBOAPx~BveQA6060wxsoCcvN8XndxGC5~VMtYf3rcMF8zWQ3x-XuKFuJeUmf2KF1x6PbLIWOwrD1FrrDenE3YRaFoIsmazPC7A-aCr2KH5daycpLjTRv8a2k9dUQrS0kNGRlOOnwzbgh5~kRjQCN~bZNmnmE-pbtlW66bP0kwxZujIywn-~oDX39kVVFDNVyJwnuZ-XkO71lGhWhfs1zWLmlPG--NiQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  ),
  category2.copyWith(
    categoryName: "Trigger Plan",
    imageUrl:
        "https://s3-alpha-sig.figma.com/img/f622/84bf/5fbfea8f4ea49c17b9d0458749644957?Expires=1614556800&Signature=YZWnkgwWRSE~DaVqHJn4EAK9oJEdearXD9kbQ-6kzCiYUmJ-iPqCc5kbW71UCEuLrbc0So5a91GAcB3RH~HulHXfV4rJxRDn~aB9iLqC30ejKOtcns7yFo4Qb2BNqP72PGp0m1LD-q9R~uU31CrmnMSDNovPWRKPWuC77PORRNiXKuPiT3icl-NOvO3dVmMgOH3~JhHrQilit63FtiPeOaMkN8~SYcOsQ8kG5UgeeAlh9UxHdnLeuJ0BHcmJORY3mW71~HqPEA7csuq7JQAtzaz9M7kJkc3u55VMd8XfBuJXKCsG3CpqBTJ~ZuSB9WrYPNdO-WfCAzqmWWQl3ws16A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  ),
  category2.copyWith(
    categoryName: "Relaxing Day",
    imageUrl:
        "https://s3-alpha-sig.figma.com/img/f672/5547/e57849a06aa896d0f171bdbd88d6e52e?Expires=1614556800&Signature=abXcxgHVvcz0p5UgboEwXsBCknhaSoEi2UNdON0-k8PsJ7CdTBHF5~lIdyVSk46~qsBI27zLTdZYMFTbvDB3wTeYed5JnGspUXI~Qdv8LTfAgPa0uLEOdLrzxxc~GvDUGCJ7~VRlN3p~EBZvz3V-NEj-T9XD9p5-O~0jD0YAkqq9ns-n8~JjXKqV58A43ZSiX24Ecanw6E15x5OXbZJAi-bH63zwP9KpwFdf21KeSIF76ZYWnBn7j6STxdbEWV2cJMY3aYXNuZpcHfdZZEXOmlH13JkA7xiwAAWm~6lgJCZ4~AN7aXhxqvACL6m8NYNxEhk8e21un2uzpWK7xPqHlw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  ),
];
