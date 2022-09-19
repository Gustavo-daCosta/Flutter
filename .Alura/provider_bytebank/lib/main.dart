import 'package:flutter/material.dart';
import 'package:provider_bytebank/models/saldo.dart';
import 'package:provider_bytebank/models/transferencias.dart';
import 'package:provider_bytebank/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Provider para o saldo
      ChangeNotifierProvider(
        create: (context) => Saldo(0),
      ),
      // Provider para transferências
      ChangeNotifierProvider(
        create: (context) => Transferencias(),
      ),
    ],
    child: const ByteBankApp(),
  ));
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueAccent[700],
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[900],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent[700]),
            //textStyle: MaterialStateProperty.all(TextStyle(color: Colors.green[900])),
          )
        )
      ),
      home: const DashBoard(),
    );
  }
}
