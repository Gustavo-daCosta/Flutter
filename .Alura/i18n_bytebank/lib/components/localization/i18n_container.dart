import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_bytebank/components/container.dart';
import 'package:i18n_bytebank/components/localization/i18n_cubit.dart';
import 'package:i18n_bytebank/components/localization/i18n_loadingView.dart';
import 'package:i18n_bytebank/http/webclients/I18N_webclient.dart';

class I18NLoadingContainer extends BlocContainer {
  final I18NWidgetCreator creator;
  final String viewKey;

  const I18NLoadingContainer({
    Key? key,
    required this.viewKey,
    required this.creator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (context) {
        final cubit = I18NMessagesCubit(viewKey);
        cubit.reload(I18NWebClient(viewKey));
        return cubit;
      },
      child: I18NLoadingView(creator: creator),
    );
  }
}
