import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/search_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/todo_cubit.dart';
import 'package:to_do_list_cubit/widgets/empty_widget.dart';
import 'package:to_do_list_cubit/widgets/floating_widget.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';
import 'package:to_do_list_cubit/widgets/label_widget.dart';
import 'package:to_do_list_cubit/widgets/list_view_widget.dart';
import 'package:to_do_list_cubit/cubits/thema_todo_cubit.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';
import 'package:to_do_list_cubit/widgets/search_widget.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    context.read<TodoCubit>().fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemaTodoCubit, ThemaTodoModel>(
      builder:
          (context, thema) => BlocConsumer<TodoCubit, List<TodoModel>>(
            listener:
                (context, state) =>
                    context.read<SearchTodoCubit>().refresh(state),
            builder:
                (context, state) =>
                    BlocBuilder<SearchTodoCubit, List<TodoModel>>(
                      builder:
                          (context, stateSearch) => Scaffold(
                            backgroundColor: thema.backgroundScaf,
                            appBar: AppBar(
                              backgroundColor: thema.backgroundAppBar,
                              title: Text(
                                'To Do List',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              centerTitle: true,
                              elevation: 2,
                            ),
                            body: Column(
                              children: [
                                // Search tugas
                                SearchWidget(thema: thema),
                                // Input tugas
                                // InputWidget(model: model, thema: thema),

                                // Label tugas & dipilih
                                LabelWidget(state: state, thema: thema),
                                SizedBox(height: 12),

                                // Daftar tugas
                                state.isEmpty
                                    ? EmptyWidget(thema: thema)
                                    : ListViewWidget(
                                      thema: thema,
                                      stateTodos: state,
                                      stateSearch: stateSearch,
                                    ),
                              ],
                            ),
                            // Floating
                            floatingActionButton: FloatingWidget(thema: thema),
                          ),
                    ),
          ),
    );
  }
}
