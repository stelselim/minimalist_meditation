import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/presentation/widgets/general/big_meditation_card.dart';
import 'package:meditate/presentation/widgets/general/header_bar.dart';
import 'package:meditate/presentation/widgets/general/mood_card.dart';
import 'package:meditate/presentation/widgets/general/salute_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioplayerCubit, AudioplayerState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header
              HeaderBar(),

              SizedBox(height: 15),

              /// Salute
              SaluteText(),

              SizedBox(height: 25),

              /// Small Mood Cards
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SmallMoodCard(
                      imagePath: "assets/icons/calm-icon.png",
                      onPressForNavigation: () {},
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      imagePath: "assets/icons/relax-icon.png",
                      onPressForNavigation: () {},
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      imagePath: "assets/icons/anxious-icon.png",
                      onPressForNavigation: () {},
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      imagePath: "assets/icons/focus-icon.png",
                      onPressForNavigation: () {},
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      imagePath: "assets/icons/anxious-icon.png",
                      onPressForNavigation: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              /// Meditation Cards
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  BigMeditationCard(
                    cardImageUrl: cardImageUrl1,
                    cardTitle: "Meditation 101",
                    cardDescription:
                        "Techniques, Benefits, and a Beginner’s How-To",
                    onPressFunction: () {},
                  ),
                  SizedBox(height: 40),
                  BigMeditationCard(
                    cardImageUrl: cardImageUrl2,
                    cardTitle: "Cardio Meditation",
                    cardDescription:
                        "Techniques, Benefits, and a Beginner’s How-To",
                    onPressFunction: () {},
                  ),
                  SizedBox(height: 40),
                  BigMeditationCard(
                    cardImageUrl: cardImageUrl2,
                    cardTitle: "Cardio Meditation",
                    cardDescription:
                        "Techniques, Benefits, and a Beginner’s How-To",
                    onPressFunction: () {},
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

const cardImageUrl1 =
    "https://s3-alpha-sig.figma.com/img/09ca/f098/29360a5494194517137564a3788350f3?Expires=1614556800&Signature=F-PYtK5xQ1-xV-SdImHotwYrSk-YJe4Iz5C2OPeho9jUIIw~HyLt08nQHaVfvmc-Bh4jc2MLmyb-wYLzE-4EDs2q58K260nNSqCbctTP2C~rF6hnWMORG2tRb7AiRMZapKLf~lkALaDfxmnF2GUNg1jSUAPFIUWfxEYLQrWg4AEEVmHvTJjWzZ-8s0vNeDFAzozBaI3K57nHhhFqx34phXIXAn-13KMhhzL7EA6s4UbkT83gwX6g2xM~8I9X7vs~qP-ipsfXGTd2UPil55GTVpC1oYlHGnOmWTFV5G9npGNlWuKBel3chMv8dgG8NN7GwVatBjUNd4eJ8yEabW57-Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";

const cardImageUrl2 =
    "https://s3-alpha-sig.figma.com/img/44d8/dbdc/05b3e6c2c95ba482a77a44c1eef5f76a?Expires=1614556800&Signature=Ka64xDXF8oukjU5K5X-BvbTdCiaDR7y2UXlwYLACMX1t85O8Grl91BrsZSahKe40RhsnxJoWacB2WkZ3jifMDUcLt5b5VOtYsIgaCwzuvBrrSu7MWmLBBhCDjG95~7aqBYT3MgK9OMYAxc~SKxxE~yD-zft2-rLj3T7TlSuHq~LHLwVK5atSk60sYd7Iv-6U1NyVEbmOdszdrlqxREyvypK-l7Uuxlv9W4MqxSaMb~6~yI7oDH5qIeSwHuDp~IoXey3piefZz9StbBRsUFI2iz1MdR1GyWS4sHBDHf8Au~tjUO3c6tGARw8Xd~GnREy88T6THkynhmJfvPdQ2SWetg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
