import 'package:flutter/material.dart';
import 'package:mercado/models/produto.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrando Produto"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            formularioCadastro(
              _controladorNome,
              "Nome do produto",
            ),
            const SizedBox(height: 15),
            formularioCadastro(
              _controladorQuantidade,
              "Quantidade",
              teclado: TextInputType.number,
            ),
            const SizedBox(height: 15),
            formularioCadastro(
              _controladorValor,
              "Valor",
              teclado: TextInputType.number,
              dica: "0.00",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Cadastrar"),
              onPressed: () {
                final String nome = _controladorNome.text;
                final int? quantidade = int.tryParse(_controladorQuantidade.text);
                final double? valor = double.tryParse(_controladorValor.text);
                if (quantidade != null && valor != null) {
                  final Produto produtoNovo = Produto(nome, quantidade, valor);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(produtoNovo.toString()))
                  );
                }
              },
            ),
          ],
        ),
      )
    );
  }
}

TextFormField formularioCadastro(
  TextEditingController controlador,
  String titulo,
  {TextInputType? teclado,
  String? dica}
) {
  return TextFormField(
    controller: controlador,
    keyboardType: teclado,
    style: const TextStyle(
      fontSize: 20,
    ),
    decoration: InputDecoration(
      labelText: titulo,
      hintText: dica,
    ),
  );
}
