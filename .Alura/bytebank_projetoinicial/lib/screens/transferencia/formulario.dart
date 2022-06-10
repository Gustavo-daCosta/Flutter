import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = "Criando Transferência";
const String _rotuloCampoNumeroConta = "Número da Conta";
const String _dicaCampoNumeroConta = "0000";
const String _rotuloCampoValor = "Valor";
const String _dicaCampoValor = "0.00";
const String _textoBotaoConfirmar = "Confirmar";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text(
                _textoBotaoConfirmar,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      )
    );
  }
  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final Transferencia transferenciaCriada = Transferencia(valor, numeroConta);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$transferenciaCriada"),),
      );
      Navigator.pop(context, transferenciaCriada);
    }
  }
}