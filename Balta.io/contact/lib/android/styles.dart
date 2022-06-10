import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Color(0xFF2AACFF);
const accentColor = Color(0xFFFFFFFF);

ThemeData androidLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme?.fromSwatch().copyWith(
      brightness: brightness,
      secondary: accentColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: brightness == Brightness.light
        ? Colors.black
        : Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: brightness == Brightness.light
        ? Colors.black
        : Colors.white,
        fontSize: 23,
        fontWeight: FontWeight.w700
      )
    ),
    fontFamily: "Poppins",
    brightness: brightness,
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.red,
      ),
    ),
  );
}

ThemeData androidDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark
  );
}