import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  final uuid = Uuid();

  void fetchTodos() async {
    try {
      Uri url = Uri.parse(
        "https://http-req-e8d2a-default-rtdb.firebaseio.com/users.json",
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Gagal Mengambil Data : ${response.statusCode}");
      }

      final decoded = jsonDecode(response.body);

      if (decoded == null) {
        emit([]);
      }

      if (decoded is! Map<String, dynamic>) {
        throw Exception("Format Tidak Sesuai");
      }

      final dataTodos = decoded;
      print(dataTodos);

      final List<TodoModel> todos =
          dataTodos.entries
              .map((entry) => TodoModel.fromJson(entry.key, entry.value))
              .toList();

      emit(todos);
    } catch (error) {
      "fetchTodos : ${error}";
    }
  }

  void addTodo(String titleController, String subtitle) async {
    try {
      Uri url = Uri.parse(
        "https://http-req-e8d2a-default-rtdb.firebaseio.com/users.json",
      );
      final newTodo = {"title": titleController, "subtitle": subtitle};
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(newTodo),
      );
      if (response.statusCode != 200) {
        throw Exception("Gagal Menambahkan Data : ${response.statusCode}");
      }
      fetchTodos();
    } catch (error) {
      "addTodo error : ${error}";
    }
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
