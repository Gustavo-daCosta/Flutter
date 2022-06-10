import 'package:flutter/material.dart';

const brightness = Brightness.dark;
Color primaryColor = const Color(0xFFFFCC00);
Color lightColor = const Color(0xFFFFFFFF);
Color backgroundColor = const Color.fromARGB(255, 77, 75, 75);
Color dangerColor = const Color(0xFFFF0000);

final ThemeData theme = ThemeData();

ThemeData darkTheme() {
  return ThemeData(
    backgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(color: primaryColor),
    brightness: brightness,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      //bodyText2: TextStyle(color: Colors.red),
      //headline1: TextStyle(fontSize: 78),
      button: TextStyle(color: Color.fromARGB(255, 121, 119, 119)),
      headline2: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
    ),
    primaryColor: primaryColor,
  );
}
