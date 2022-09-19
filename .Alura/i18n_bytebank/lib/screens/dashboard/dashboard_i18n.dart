import 'package:flutter/material.dart';
import 'package:i18n_bytebank/components/localization/eager_localization.dart';
import 'package:i18n_bytebank/components/localization/i18n_messages.dart';

class DashboardViewLazyI18N {
  final I18NMessages messages;

  DashboardViewLazyI18N(this.messages);

  // _ é para constante, define se você também vai usar para não constante
  String get transfer => messages.get("transfer");
  String get transactionFeed => messages.get("transaction_feed");
  String get changeName => messages.get("change_name");
}

// eager
class DashboardViewI18N extends ViewI18N {
  DashboardViewI18N(BuildContext context) : super(context);

  String get transfer => localize({"pt-br": "Transferir", "en": "Transfer"});
  String get transactionFeed => localize({"pt-br": "Transações", "en": "Transaction Feed"});
  String get changeName => localize({"pt-br": "Mudar nome", "en": "Change name"});
}
