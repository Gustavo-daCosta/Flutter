import 'package:flutter/material.dart';

const brightness = Brightness.light;
Color primaryColor = const Color(0xFF00C569);
Color lightColor = const Color(0xFFFFFFFF);
Color backgroundColor = const Color.fromARGB(255, 223, 219, 219);
//Color dangerColor = const Color(0xFFFF0000);

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme:  const AppBarTheme(
      color: Colors.white,
    ),
    backgroundColor: backgroundColor,
    brightness: brightness,
    primaryIconTheme: const IconThemeData(
      color: Color.fromARGB(255, 124, 121, 121)
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      //bodyText2: TextStyle(color: Colors.red),
      //headline1: TextStyle(fontSize: 78),
      button: TextStyle(
        color: Colors.grey
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
      //button: TextStyle(color: Colors.green),
    ),
    primaryColor: primaryColor,
  );
}
