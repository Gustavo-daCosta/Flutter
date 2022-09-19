import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_bytebank/components/container.dart';

// localization and internationalization

class LocalizationContainer extends BlocContainer {
  final Widget child;

  const LocalizationContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CurrentLocaleCubit(),
      child: child,
    );
    // return BlocProvider<CurrentLocaleCubit>(
    //   create: (context) => CurrentLocaleCubit(),
    //   child: child,
    // );
  }
}

class CurrentLocaleCubit extends Cubit<String> {
  CurrentLocaleCubit() : super("en");
}