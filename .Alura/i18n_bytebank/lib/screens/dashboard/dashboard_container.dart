import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_bytebank/components/container.dart';
import 'package:i18n_bytebank/components/localization/i18n_container.dart';
import 'package:i18n_bytebank/models/name.dart';
import 'package:i18n_bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:i18n_bytebank/screens/dashboard/dashboard_view.dart';

class DashboardContainer extends BlocContainer {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NameCubit>(
      create: (_) => NameCubit("Gustavo"),
      child: I18NLoadingContainer(
        viewKey: "dashboard",
        creator: (messages) => DashboardView(DashboardViewLazyI18N(messages)),
      ),
    );
  }
}
