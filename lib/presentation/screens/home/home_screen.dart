import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/infrastructure/dummy_data.dart';
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
                      playlist: calmList,
                      imagePath: "assets/icons/calm-icon.png",
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      playlist: relaxList,
                      imagePath: "assets/icons/relax-icon.png",
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      playlist: focusList,
                      imagePath: "assets/icons/focus-icon.png",
                    ),
                    SizedBox(width: 30),
                    SmallMoodCard(
                      playlist: anxiousList,
                      imagePath: "assets/icons/anxious-icon.png",
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
                  /// Meditation 101 Card
                  BigMeditationCard(
                    categoryModel: homeMeditation101,
                  ),
                  SizedBox(height: 40),

                  /// Cardio Card
                  BigMeditationCard(
                    categoryModel: homeCardio,
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
