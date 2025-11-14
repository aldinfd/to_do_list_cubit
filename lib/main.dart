import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/chosen_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/search_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/thema_todo_cubit.dart';
import 'package:to_do_list_cubit/cubits/todo_cubit.dart';
import 'package:to_do_list_cubit/screens/todos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => ThemaTodoCubit()),
        BlocProvider(create: (_) => ChosenTodoCubit()),
        BlocProvider(create: (_) => SearchTodoCubit()),
      ],
      child: MaterialApp(
        title: 'To Do List',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TodoScreen(),
      ),
    );
  }
}
