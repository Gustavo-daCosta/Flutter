import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Verifica se o aplicativo está em modo de debug
  if (kDebugMode) {
    // Comando para desabilitar o crashlytics no aplicativo
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseCrashlytics.instance.setUserIdentifier('alura123');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  // runZonedGuarded captura os erros que o Flutter não é capaz de registrar, como erros do Dart
  runZonedGuarded<Future<void>>(() async {
    runApp(const ByteBankApp());
  }, FirebaseCrashlytics.instance.recordError);
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(Colors.blueAccent[700]),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const DashBoard(),
    );
  }
}