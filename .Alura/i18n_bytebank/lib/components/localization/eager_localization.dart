import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_bytebank/components/localization/locale.dart';

class ViewI18N {
  late String _language;

  ViewI18N(BuildContext context) {
    // o problema dessa abordagem é o rebuild quanto você troca o idioma
    // o que você quer reconstruir quanto trocar o currentLocaleCubit?
    // em geral, é comum reinicializar o sistema ou voltar para a tela inicial.
    _language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  // tentar arrumar um jeito de fazer essa operação sem o null check operator (!)
  String localize(Map<String, String> values) {
    // o assert substitui o if para verificar valores
    // assert(values != null);
    assert(values.containsKey(_language));
    // você poderia definir que o padrão  é mostrar em inglês ao invés de quebrar a aplicação

    return (values[_language])!;
  }
}
