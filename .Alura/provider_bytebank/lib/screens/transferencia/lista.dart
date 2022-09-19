import 'package:provider/provider.dart';
import 'package:provider_bytebank/models/transferencia.dart';
import 'package:provider_bytebank/models/transferencias.dart';
import 'package:provider_bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = "Transferências";

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final Transferencia transferencia = transferencias.transferencias[indice];
              return ItemTransferencia(transferencia);
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              }
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(
    this._transferencia,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.toStringValor()),
        subtitle: Text(_transferencia.toStringConta()),
      ),
    );
  }
}

