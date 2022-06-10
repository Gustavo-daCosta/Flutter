import 'package:flutter/material.dart';
import 'package:mercado/pages/home_page.dart';

void main() => runApp(const MarketApp());

class MarketApp extends StatelessWidget {
  const MarketApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
