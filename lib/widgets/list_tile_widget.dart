import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/chosen_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/search_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/todo_cubit.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';
import 'package:to_do_list_cubit/widgets/form_add_edit_widget.dart';

class ListTileWidget extends StatelessWidget {
  final List<TodoModel> stateTodos;
  final ThemaTodoModel thema;
  final TodoModel todo;
  const ListTileWidget({
    super.key,
    required this.todo,
    required this.thema,
    required this.stateTodos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: thema.bgContainerListTileColor,
        borderRadius: BorderRadius.circular(12),
      ),

      // Listile
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        // Check
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: thema.avatarColor,
          child: IconButton(
            onPressed: () {
              context.read<TodoCubit>().activeTodo(todo.id);
              // Mengambil dta langsung yang sudah terupdate
              final updatedTodo = context.read<TodoCubit>().state.firstWhere(
                (t) => t.id == todo.id,
              );
              context.read<ChosenTodoCubit>().chosen(updatedTodo.active);
              // print(updatedTodo.active);
              context.read<SearchTodoCubit>().refresh(stateTodos);
            },
            icon: Icon(
              todo.active ? Icons.check : Icons.circle_outlined,
              color: todo.active ? Colors.green : Colors.grey[600],
            ),
          ),
        ),

        // Title
        title: Text(
          todo.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            decoration: todo.active ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 3,
            color: thema.textListTileColor,
          ),
        ),

        // Subtitle
        subtitle: Text(
          todo.subtitle,
          style: TextStyle(
            decoration: todo.active ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 2,
            color: thema.isDark ? Colors.grey[300] : Colors.black,
          ),
        ),

        // Icon delete & edit
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: thema.bgListTileColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder:
                      (context) => FormAddEditWidget(thema: thema, todo: todo),
                );
              },
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              color: thema.iconsColor,
            ),
            IconButton(
              onPressed: () {
                context.read<TodoCubit>().deleteTodo(todo.id);
                context.read<ChosenTodoCubit>().chosenDelete();
                context.read<SearchTodoCubit>().refresh(stateTodos);
              },
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Hapus',
              color: thema.iconsColor,
            ),
          ],
        ),
      ),
    );
  }
}
