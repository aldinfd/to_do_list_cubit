import 'package:flutter/material.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';
import 'package:to_do_list_cubit/widgets/list_tile_widget.dart';

class ListViewWidget extends StatelessWidget {
  final List<TodoModel> stateTodos;
  final List<TodoModel> stateSearch;
  final ThemaTodoModel thema;
  const ListViewWidget({
    super.key,
    required this.thema,
    required this.stateTodos,
    required this.stateSearch,
  });

  @override
  Widget build(BuildContext context) {
    final listToShow = stateSearch.isEmpty ? stateTodos : stateSearch;
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: listToShow.length,
        itemBuilder: (context, index) {
          final todo = listToShow[index];
          return ListTileWidget(
            todo: todo,
            thema: thema,
            stateTodos: stateTodos,
          );
        },
      ),
    );
  }
}
