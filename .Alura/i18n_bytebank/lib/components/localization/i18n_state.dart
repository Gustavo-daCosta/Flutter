import 'package:flutter/material.dart';
import 'package:i18n_bytebank/components/localization/i18n_messages.dart';

@immutable
abstract class I18NMessagesState {
  const I18NMessagesState();
}

@immutable
class InitI18NMessagesState extends I18NMessagesState {
  const InitI18NMessagesState();
}

@immutable
class LoadingI18NMessagesState extends I18NMessagesState {
  const LoadingI18NMessagesState();
}

@immutable
class LoadedI18NMessagesState extends I18NMessagesState {
  final I18NMessages messages;

  const LoadedI18NMessagesState(this.messages);
}

@immutable
class FatalErrorI18NMessagesState extends I18NMessagesState {
  const FatalErrorI18NMessagesState();
}