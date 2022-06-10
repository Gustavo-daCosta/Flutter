import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {

  const ListaTransferencias({ Key? key }) : super(key: key);

  @override
  State<ListaTransferencias> createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioTransferencia(),
            ),
          ).then<Transferencia?>((transferenciaRecebida) => _atualizar(transferenciaRecebida));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final Transferencia transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia: transferencia);
        },
      ),
    );
  }
  _atualizar(Transferencia transferenciaRecebida) {
    setState(() {
      _transferencias.add(transferenciaRecebida);
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.monetization_on,
          size: 35,
        ),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}
