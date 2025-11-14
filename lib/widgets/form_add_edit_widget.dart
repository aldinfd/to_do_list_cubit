import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/todo_cubit.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';
import 'package:to_do_list_cubit/models/todo_model.dart';

class FormAddEditWidget extends StatefulWidget {
  final ThemaTodoModel thema;
  final TodoModel? todo;
  const FormAddEditWidget({super.key, required this.thema, this.todo});

  @override
  State<FormAddEditWidget> createState() => _FormAddEditWidgetState();
}

class _FormAddEditWidgetState extends State<FormAddEditWidget> {
  late TextEditingController titleController;
  late TextEditingController subtitleController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.todo?.title);
    subtitleController = TextEditingController(text: widget.todo?.subtitle);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.todo == null ? "Masukan Baru" : "Edit Tugas",
          style: TextStyle(
            color: widget.thema.textInputColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Judul
              TextField(
                style: TextStyle(color: widget.thema.textInputColor),
                cursorColor: widget.thema.cursorColor,
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Judul",
                  hintStyle: TextStyle(color: widget.thema.hintTextColor),
                  filled: true,
                  fillColor: widget.thema.textFieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Deskripsi
              TextField(
                style: TextStyle(color: widget.thema.textInputColor),
                cursorColor: widget.thema.cursorColor,
                controller: subtitleController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  hintStyle: TextStyle(color: widget.thema.hintTextColor),
                  filled: true,
                  fillColor: widget.thema.textFieldColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Simpan & keluar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // print(model.titleController.text);
                      // print(model.subtitleController.text);
                      if (titleController.text.isEmpty ||
                          subtitleController.text.isEmpty) {
                        return;
                      }

                      widget.todo == null
                          ? context.read<TodoCubit>().addTodo(
                            titleController.text,
                            subtitleController.text,
                          )
                          : context.read<TodoCubit>().editTodo(
                            widget.todo!.id,
                            titleController.text,
                            subtitleController.text,
                          );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.thema.buttonAddColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.thema.buttonAddColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      'Kembali',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
