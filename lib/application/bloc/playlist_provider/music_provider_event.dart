part of 'music_provider_bloc.dart';

@immutable
abstract class MusicProviderEvent {}

class CategorySelected extends MusicProviderEvent {
  final String categoryId;
  CategorySelected({
    @required this.categoryId,
  }) : assert(categoryId != null);
}

class MoodSelected extends MusicProviderEvent {
  final String mood;
  MoodSelected({
    @required this.mood,
  }) : assert(mood != null);
}
