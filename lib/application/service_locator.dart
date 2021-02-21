import 'package:get_it/get_it.dart';
import 'package:meditate/application/bloc/currently_playing/audio_model_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AudioModelCubit>(AudioModelCubit());
}
