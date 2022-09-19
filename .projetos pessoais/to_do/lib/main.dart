import 'package:flutter/material.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/new_task.dart';

void main() => runApp(const ToDoApp());

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent[700],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.black
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 241, 247, 250),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent[700],
        )
      ),
      home: NewTaskPage(),
    );
  }
}
