import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  final uuid = Uuid();

  void addTodo(String titleController, String subtitle) {
    TodoModel todo = TodoModel(
      id: uuid.v4(),
      title: titleController,
      subtitle: subtitle,
    );
    emit([...state, todo]);
  }

  void editTodo(String idTodo, String newTitle, String newSubtitle) {
    emit(
      state.map((todo) {
        if (todo.id == idTodo) {
          return TodoModel(id: todo.id, title: newTitle, subtitle: newSubtitle);
        }
        return todo;
      }).toList(),
    );
  }

  void deleteTodo(String id) {
    emit(state.where((todo) => todo.id != id).toList());
  }

  void activeTodo(String id) {
    emit(
      state.map((todo) {
        if (todo.id == id) {
          return todo.copyWith(active: !todo.active);
        }
        return todo;
      }).toList(),
    );
  }
}
