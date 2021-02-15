part of 'bottomnavbar_cubit.dart';

@immutable
class BottomnavbarState {
  final int index;
  BottomnavbarState({
    @required this.index,
  });

  BottomnavbarState copyWith({
    int index,
  }) {
    return BottomnavbarState(
      index: index ?? this.index,
    );
  }
}
