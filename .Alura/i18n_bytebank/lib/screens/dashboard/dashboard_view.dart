import 'package:i18n_bytebank/components/container.dart';
import 'package:i18n_bytebank/models/name.dart';
import 'package:i18n_bytebank/screens/contacts_list.dart';
import 'package:i18n_bytebank/screens/dashboard/dashboard_feature_item.dart';
import 'package:i18n_bytebank/screens/dashboard/dashboard_i18n.dart';
//import 'package:bytebank/screens/counter.dart';
import 'package:i18n_bytebank/screens/name.dart';
import 'package:i18n_bytebank/screens/transactions_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  final DashboardViewLazyI18N i18n;

  const DashboardView(this.i18n, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // misturando um BlocBuilder (que é um observador de eventos) com UI
        title: BlocBuilder<NameCubit, String>(
          builder: (context, state) => Text("Welcome $state"),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/bytebank_logo.png"),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      FeatureItem(
                        i18n.transfer,
                        Icons.monetization_on,
                        onClick: () => _showContactsList(context),
                      ),
                      FeatureItem(
                        i18n.transactionFeed,
                        Icons.description,
                        onClick: () => _showTransactionsList(context),
                      ),
                      FeatureItem(
                        i18n.changeName,
                        Icons.person_outline,
                        onClick: () => _showChangeName(context),
                      ),
                    ],
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showContactsList(BuildContext blocContext) => push(blocContext, const ContactsListContainer());

void _showTransactionsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ),
  );
}

void _showChangeName(BuildContext blocContext) {
  /*
  * O MaterialPageRoute passa um contexto padrão (pois é um builder), então é
  * preciso reinjetar o cubit na mudança de rota. Para isso, usa-se o
  * BlocProvider.value junto com o BlocProvider.of para buscar o Cubit
  * necessário no contexto que já tem a injeção, o blocContext, e injeta no
  * contexto para o container que está sendo chamado.
  */
  Navigator.of(blocContext).push(
    MaterialPageRoute(
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: const NameContainer(),
        );
      },
    ),
  );
}
