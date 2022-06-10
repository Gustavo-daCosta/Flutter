import 'package:flutter/material.dart';

// COLORS SECTION
Brightness brightness = Brightness.light;
const primaryColor = Color.fromARGB(255, 196, 128, 61);
const accentColor = Color.fromRGBO(250, 237, 205, 1.0);

ThemeData lightTheme() {
  return ThemeData(
    //backgroundColor: accentColor,
    scaffoldBackgroundColor: accentColor,
    brightness: brightness,
    primaryColor: primaryColor,
    colorScheme: ColorScheme?.fromSwatch().copyWith(
      brightness: brightness,
      secondary: accentColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
      centerTitle: true,
      color: primaryColor,
      iconTheme: IconThemeData(color: accentColor),
    ),
  );
}
