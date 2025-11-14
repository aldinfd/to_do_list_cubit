import 'package:flutter/material.dart';

class ThemaTodoModel {
  final bool isDark;

  ThemaTodoModel({this.isDark = false});

  ThemaTodoModel copyWith({bool? isDark}) {
    return ThemaTodoModel(isDark: isDark ?? this.isDark);
  }

  // Todo screen
  Color get backgroundScaf => isDark ? Colors.black : Colors.white;
  IconData get icon => isDark ? Icons.nights_stay : Icons.wb_sunny;
  Color get textColor => isDark ? Colors.white : Colors.black;

  // Input widget
  Color get backgroundAppBar => isDark ? Colors.grey[900]! : Colors.blue;
  Color get cursorColor => isDark ? Colors.white : Colors.black;
  Color get hintTextColor => isDark ? Colors.white : Colors.grey[600]!;
  Color get textFieldColor => isDark ? Colors.grey[850]! : Colors.grey[200]!;
  Color get iconsColor => isDark ? Colors.white : Colors.grey[600]!;
  Color get buttonAddColor => isDark ? Colors.grey[850]! : Colors.blue;
  Color get textInputColor => isDark ? Colors.white : Colors.black;

  // Label widget
  Color get labelColor => isDark ? Colors.white : Colors.black;

  // ListTile widget
  Color get bgContainerListTileColor =>
      isDark ? Colors.grey[850]! : Colors.grey[200]!;
  Color get avatarColor => isDark ? Colors.grey[900]! : Colors.white;
  Color get textListTileColor => isDark ? Colors.white : Colors.black;
  Color get bgListTileColor => isDark ? Colors.grey[900]! : Colors.white;

  // Floating widget
  Color? get overlayColorSpeeDial => isDark ? Colors.grey[600]! : null;
  Color get showBackgroudColor => isDark ? Colors.grey[900]! : Colors.white;
  String get label => isDark ? "Gelap" : "Terang";
}
