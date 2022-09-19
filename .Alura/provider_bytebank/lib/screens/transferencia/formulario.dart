import 'package:provider/provider.dart';
import 'package:provider_bytebank/components/editor.dart';
import 'package:provider_bytebank/models/saldo.dart';
import 'package:provider_bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:provider_bytebank/models/transferencias.dart';

const String _tituloAppBar = "Criando Transferência";
const String _rotuloCampoValor = "Valor";
const String _dicaCampoValor = "0.00";
const String _rotuloCampoNumeroConta = "Número da conta";
const String _dicaCampoNumeroConta = "0000";
const String _textoBotaoConfirmar = "Confimar";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final transferenciaValida = _validaTransferencia(context, numeroConta, valor);
    if (transferenciaValida) {
      final Transferencia novaTransferencia = Transferencia(valor!, numeroConta!);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  bool _validaTransferencia(BuildContext context, int? numeroConta, double? valor) {
    final bool camposPreenchidos = numeroConta != null && valor != null;
    final bool saldoSuficiente = valor! <= Provider.of<Saldo>(context, listen: false).valor;
    return camposPreenchidos && saldoSuficiente;
  }

  void _atualizaEstado(BuildContext context, Transferencia novaTransferencia, double valor) {
    Provider.of<Transferencias>(context, listen: false).adicionar(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).subtrair(valor);
  }
}
