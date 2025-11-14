import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';

class SearchTodoCubit extends Cubit<List<TodoModel>> {
  SearchTodoCubit() : super([]);

  String lastKeyword = "";
  void searchTodo(String keyword, List<TodoModel> todos) {
    lastKeyword = keyword;
    if (keyword.isEmpty) {
      emit([]);
      return;
    }

    final result =
        todos
            .where(
              (todo) =>
                  todo.title.toLowerCase().contains(keyword.toLowerCase()),
            )
            .toList();

    emit(result); // hasil pencarian dikirim ke state
  }

  void refresh(List<TodoModel> todos) {
    if (lastKeyword.isEmpty) {
      return emit([]);
    } else {
      searchTodo(lastKeyword, todos);
    }
  }
}
