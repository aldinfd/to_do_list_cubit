import 'package:flutter_bloc/flutter_bloc.dart';

class ChosenTodoCubit extends Cubit<int> {
  ChosenTodoCubit() : super(0);

  void chosen(bool active) {
    if (active) {
      emit(state + 1);
    } else {
      emit(state - 1);
    }
  }

  void chosenDelete() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
