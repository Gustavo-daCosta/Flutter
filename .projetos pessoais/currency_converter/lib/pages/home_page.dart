import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          TextButton(
            child: Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CurrencyCard("https://iili.io/hX06jn.png", "BRL"),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.compare_arrows_outlined),
                ),
                CurrencyCard("https://iili.io/hX0PQs.png", "USD")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  final String coinImageUrl;
  final String coinInitials;

  const CurrencyCard(this.coinImageUrl, this.coinInitials, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Image.network(
              coinImageUrl,
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 7),
            Text(
              coinInitials,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
