import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/chosen_todo_cubit.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';

class LabelWidget extends StatelessWidget {
  final ThemaTodoModel thema;
  final List<TodoModel> state;
  const LabelWidget({super.key, required this.state, required this.thema});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${state.length.toString()} tugas',
            style: TextStyle(color: thema.labelColor),
          ),
          BlocBuilder<ChosenTodoCubit, int>(
            builder:
                (context, state) => Text(
                  '${state.toString()} dipilih',
                  style: TextStyle(color: thema.labelColor),
                ),
          ),
        ],
      ),
    );
  }
}
