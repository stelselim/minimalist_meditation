import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioplayerCubit, AudioplayerState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [],
          ),
        );
      },
    );
  }
}
