import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnavbar_state.dart';

class BottomnavbarCubit extends Cubit<BottomnavbarState> {
  BottomnavbarCubit() : super(BottomnavbarState(index: 0));

  void changeScreen(int newIndex) => emit(state.copyWith(index: newIndex));
}
