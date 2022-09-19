import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_bytebank/components/editor.dart';
import 'package:provider_bytebank/models/saldo.dart';

const String _tituloAppBar = "Receber depósito";
const String _dicaCampoValor = "0.00";
const String _rotuloCampoValor = "Valor";
const String _textoBotaoConfirmar = "Confirmar";

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioDeposito({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaDeposito(context),
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }
  void _criaDeposito(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);
    if (depositoValido) {
      _atualizaEstado(context, valor!);
      Navigator.pop(context);
    }
  }

  _validaDeposito(double? valor) => valor != null;

  _atualizaEstado(BuildContext context, double valor) {
    Provider.of<Saldo>(context, listen: false).adicionar(valor);
  } 
}