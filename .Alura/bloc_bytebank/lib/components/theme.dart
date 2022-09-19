import 'package:flutter/material.dart';

final Color? primaryColor = Colors.green[900];
final Color? accentColor = Colors.blueAccent[700];

final ThemeData bytebankTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: accentColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(accentColor),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
);