import 'package:flutter/material.dart';

Brightness brightness = Brightness.dark;
Color primaryColor = const Color(0xFFFDBF00);
Color accentColor = const Color(0xFFFFFFFF);

ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    fontFamily: "Montserrat",
    primaryColor: primaryColor,
    colorScheme: ColorScheme?.fromSwatch().copyWith(
      brightness: brightness,
      secondary: accentColor
    )
  );
}