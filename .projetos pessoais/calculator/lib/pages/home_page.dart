import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String imageUrl = "https://pbs.twimg.com/profile_images/1446258566671835149/vsUwB8xF_400x400.jpg";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text(
          "Aplicativo do Dr. Gatinho Sorvete",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Image.network(imageUrl),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text("Clique aqui para receber um abraço!"),
            )
          ],
        ),
      ),
    );
  }
}