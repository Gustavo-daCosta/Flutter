import 'package:flutter/material.dart';
import 'package:minimal_login/pages/homepage.dart';

void main() {
  runApp(const MinimalLoginApp());
}

class MinimalLoginApp extends StatelessWidget {
  const MinimalLoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
