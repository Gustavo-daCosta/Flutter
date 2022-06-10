import 'package:flutter/material.dart';

// COLORS SECTION
Brightness brightness = Brightness.dark;
const primaryColor = Color.fromARGB(255, 172, 78, 2);
const accentColor = Color.fromARGB(255, 190, 142, 102);

ThemeData darkTheme() {
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
