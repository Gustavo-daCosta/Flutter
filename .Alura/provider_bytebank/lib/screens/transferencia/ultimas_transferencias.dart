import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bytebank/models/transferencias.dart';
import 'package:provider_bytebank/screens/transferencia/lista.dart';

const String _titulo = "Últimas transferências";

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          _titulo,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final List ultimasTransferencias = transferencias.transferencias.reversed.toList();
            final int quantidade = transferencias.transferencias.length;
            if (quantidade == 0) {
              return const SemTransferenciaCadastrada();
            }
            int tamanho = quantidade < 4 ? quantidade : 3;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: tamanho,
              shrinkWrap: true,
              itemBuilder: (context, indice) {
                return ItemTransferencia(ultimasTransferencias[indice]);
              },
            );
          },
        ),
        TextButton(
          onPressed: () { 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListaTransferencias(),
              ),
            );
          },
          child: const Text(
            "Ver todas transferências",
            style: TextStyle(
              color: Colors.green,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  const SemTransferenciaCadastrada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(
              Icons.info_outline,
              size: 36
            ),
            Text(
              "Você ainda não cadastrou\nnenhuma transferência",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
