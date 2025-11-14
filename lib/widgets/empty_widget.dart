import 'package:flutter/widgets.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';

class EmptyWidget extends StatelessWidget {
  final ThemaTodoModel thema;
  const EmptyWidget({super.key, required this.thema});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          "Tidak ada tugas",
          style: TextStyle(color: thema.textColor),
        ),
      ),
    );
  }
}
