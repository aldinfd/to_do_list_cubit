import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/search_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/todo_cubit.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';

class SearchWidget extends StatelessWidget {
  final ThemaTodoModel thema;
  const SearchWidget({super.key, required this.thema});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
      // Input
      TextField(
        // enabled: false,
        cursorColor: thema.cursorColor,
        style: TextStyle(color: thema.textInputColor),
        onChanged: (value) {
          final todos = context.read<TodoCubit>().state;
          context.read<SearchTodoCubit>().searchTodo(value, todos);
          // print(value);
        },
        decoration: InputDecoration(
          hintText: 'Masukan tugas yang dicari...',
          hintStyle: TextStyle(color: thema.hintTextColor),
          filled: true,
          fillColor: thema.textFieldColor,
          prefixIcon: Icon(Icons.search, color: thema.iconsColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
