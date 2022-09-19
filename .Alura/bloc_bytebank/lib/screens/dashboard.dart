import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/name.dart';
import 'package:bytebank/screens/contacts_list.dart';
//import 'package:bytebank/screens/counter.dart';
import 'package:bytebank/screens/name.dart';
import 'package:bytebank/screens/transactions_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashBoardContainer extends BlocContainer {
  const DashBoardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NameCubit>(
      create: (_) => NameCubit("Gustavo"),
      child: const DashBoardView(),
    );
  }
}

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

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
                      _FeatureItem(
                        "Transfer",
                        Icons.monetization_on,
                        onClick: () => _showContactsList(context),
                      ),
                      _FeatureItem(
                        "Transaction Feed",
                        Icons.description,
                        onClick: () => _showTransactionsList(context),
                      ),
                      _FeatureItem(
                        "Change name",
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

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  const _FeatureItem(
    this.name,
    this.icon,
    {Key? key,
    required this.onClick,}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            width: 150,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showContactsList(BuildContext blocContext) {
  return push(blocContext, const ContactsListContainer());
}

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
