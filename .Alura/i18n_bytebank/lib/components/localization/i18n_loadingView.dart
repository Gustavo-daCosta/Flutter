import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_bytebank/components/localization/i18n_cubit.dart';
import 'package:i18n_bytebank/components/localization/i18n_messages.dart';
import 'package:i18n_bytebank/components/localization/i18n_state.dart';
import 'package:i18n_bytebank/components/error_view.dart';
import 'package:i18n_bytebank/components/progress/progress_view.dart';

typedef I18NWidgetCreator = Widget Function(I18NMessages messages);

class I18NLoadingView extends StatelessWidget {
  final I18NWidgetCreator creator;

  const I18NLoadingView({
    Key? key,
    required this.creator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18NMessagesCubit, I18NMessagesState>(
      builder: (context, state) {
        if (state is InitI18NMessagesState || state is LoadingI18NMessagesState) {
          return const ProgressView(message: "Loading...");
        }
        if (state is LoadedI18NMessagesState) {
          final I18NMessages messages = state.messages;
          return creator.call(messages);
        }
        return const ErrorView("Erro buscando mensagens da tela");
      },
    );
  }
}
