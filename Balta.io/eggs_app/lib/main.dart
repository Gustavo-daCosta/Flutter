import 'package:eggs_app/pages/splash_page.dart';
import 'package:eggs_app/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/app_blocs.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppBloc>.value(
          value: AppBloc(),
        ),
      ],
      child: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfect Eggs',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(), 
    );
  }
}