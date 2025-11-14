import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_cubit/cubits/thema_todo_cubit.dart';
import 'package:to_do_list_cubit/models/thema_todo_model.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:to_do_list_cubit/widgets/form_add_edit_widget.dart';

class FloatingWidget extends StatelessWidget {
  final ThemaTodoModel thema;
  const FloatingWidget({super.key, required this.thema});

  @override
  Widget build(BuildContext context) {
    // return FloatingActionButton(
    //   backgroundColor: thema.backgroundAppBar,
    //   onPressed: () {
    //     context.read<ThemaTodoCubit>().themaDark();
    //   },
    //   child: Icon(thema.icon, color: thema.textColor),
    // );
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      backgroundColor: thema.backgroundAppBar,
      iconTheme: IconThemeData(color: Colors.white),
      overlayColor: thema.overlayColorSpeeDial,
      children: [
        SpeedDialChild(
          backgroundColor: thema.backgroundAppBar,
          child: Icon(Icons.add, color: Colors.white),

          label: 'Tambah',
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: thema.showBackgroudColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) => FormAddEditWidget(thema: thema),
            );
          },
        ),
        SpeedDialChild(
          backgroundColor: thema.backgroundAppBar,
          child: Icon(thema.icon, color: Colors.white),
          label: thema.label,
          onTap: () {
            context.read<ThemaTodoCubit>().themaDark();
          },
        ),
      ],
    );
  }
}
