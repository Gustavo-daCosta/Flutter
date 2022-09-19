import 'package:i18n_bytebank/components/localization/locale.dart';
import 'package:i18n_bytebank/components/theme.dart';
import 'package:i18n_bytebank/screens/dashboard/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const ByteBankApp());
  }, blocObserver: LogBloc());
  // Na prática evitar log do gênero
  // pois pode vazar informações sensíveis para o log
}

class LogBloc extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("${bloc.runtimeType} > $change");
    super.onChange(bloc, change);
  }
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bytebankTheme,
      debugShowCheckedModeBanner: false,
      home: const LocalizationContainer(
        child: DashboardContainer(),
      ),
    );
  }
}