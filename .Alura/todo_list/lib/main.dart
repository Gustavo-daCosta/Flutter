import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:todo_list/colors/principal_color.dart';
//import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/screens/to_do_list_screen.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: PrincipalGreyColor.color,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff1587f9),
        )
      ),
      home: ToDoListPage(),
    );
  }
}
