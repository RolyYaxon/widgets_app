import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.amber,
  Colors.redAccent,
  Colors.green,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0,
  this.isDarkMode=false,
  })
      : assert(selectedColor >= 0, "Selected color must be greater than 0"),
        assert(selectedColor < colorList.length,
            "Selected color must be lesser or equal than ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark: Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
