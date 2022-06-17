import 'package:currency_converter/pages/home_page.dart';
import 'package:currency_converter/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CurrencyConverterApp());

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Currency Converter App",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: HomePage(),
    );
  }
}
