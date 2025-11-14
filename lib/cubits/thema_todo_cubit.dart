import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';

class ThemaTodoCubit extends Cubit<ThemaTodoModel> {
  ThemaTodoCubit() : super(ThemaTodoModel());

  void themaDark() {
    emit(state.copyWith(isDark: !state.isDark));
  }
}
