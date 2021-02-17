part of 'audioplayer_bloc.dart';

@immutable
abstract class AudioplayerEvent {}

class PlayEvent extends AudioplayerEvent {}

class PauseEvent extends AudioplayerEvent {}

class ResumeEvent extends AudioplayerEvent {}
