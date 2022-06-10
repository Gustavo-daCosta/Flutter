import 'package:contact/android/styles.dart';
import 'package:contact/android/views/home_view.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: androidLightTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}