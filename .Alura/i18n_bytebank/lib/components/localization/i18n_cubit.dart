import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_bytebank/components/localization/i18n_messages.dart';
import 'package:i18n_bytebank/components/localization/i18n_state.dart';
import 'package:i18n_bytebank/http/webclients/I18N_webclient.dart';
import 'package:localstorage/localstorage.dart';

class I18NMessagesCubit extends Cubit<I18NMessagesState> {
  final String _viewKey;
  final LocalStorage storage = LocalStorage("unsecure_local_version_1.json");

  I18NMessagesCubit(this._viewKey) : super(const InitI18NMessagesState());

  reload(I18NWebClient client) async {
    emit(const LoadingI18NMessagesState());
    await storage.ready;
    final items = storage.getItem(_viewKey);
    debugPrint("Loaded $_viewKey $items");
    if (items != null) {
      emit(LoadedI18NMessagesState(I18NMessages(items)));
      //return;
    }
    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(_viewKey, messages);
    debugPrint("saving $_viewKey $messages");
    final state = LoadedI18NMessagesState(I18NMessages(messages));
    emit(state);
  }
}