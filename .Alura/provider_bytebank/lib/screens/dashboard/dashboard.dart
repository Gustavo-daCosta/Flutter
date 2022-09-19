import 'package:flutter/material.dart';
import 'package:provider_bytebank/screens/dashboard/saldo.dart';
import 'package:provider_bytebank/screens/deposito/formulario.dart';
import 'package:provider_bytebank/screens/transferencia/formulario.dart';
import 'package:provider_bytebank/screens/transferencia/ultimas_transferencias.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ByteBank"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormularioDeposito(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text("Receber depósito"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormularioTransferencia(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text("Nova Transferência"),
              ),
            ],
          ),
          const UltimasTransferencias(),
        ],
      ),
    );
  }
}
