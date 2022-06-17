import 'package:flutter/material.dart';

const Brightness brightness = Brightness.light;
const Color primaryColor = Colors.blueAccent;
const Color accentColor = Colors.white;
const Color backgroundColor = Colors.white;

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    brightness: brightness,
    backgroundColor: backgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: accentColor,
      tertiary: Colors.black,
      brightness: brightness,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
  );
}
