import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/audio_model_cubit/audio_model_cubit.dart';
import 'package:meditate/application/bloc/audio_player/audioplayer_cubit.dart';
import 'package:meditate/application/bloc/bottomNavBar/bottomnavbar_cubit.dart';

import 'package:meditate/application/bloc/playlist_provider/music_provider_bloc.dart';
import 'package:meditate/application/bloc/song_provider/song_provider_cubit.dart';
import 'package:meditate/infrastructure/repositories/music_provider_repository.dart';
import 'package:meditate/presentation/core/route_generator.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  static final musicProviderRepository = MusicProviderRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomnavbarCubit()),
        BlocProvider(create: (_) => AudioModelCubit()),
        BlocProvider(create: (_) => AudioplayerCubit()),
        BlocProvider(create: (_) => MusicProviderBloc(musicProviderRepository)),
        BlocProvider(create: (_) => SongProviderCubit(musicProviderRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
