import 'package:e_commerce/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-Commerce App",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
