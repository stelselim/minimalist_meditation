part of 'audio_model_cubit.dart';

class AudioModelState {
  final AudioModel audioModel;
  AudioModelState({
    this.audioModel,
  });

  AudioModelState copyWith({
    AudioModel audioModel,
  }) {
    return AudioModelState(
      audioModel: audioModel ?? this.audioModel,
    );
  }
}
