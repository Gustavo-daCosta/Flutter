import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endereço do Contato"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: ListTile(
              title: const Text(
                "Endereço atual",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Rua do Desenvolvedor, 256",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                  Text(
                    "Santo André - SP",
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ],
              ),
              isThreeLine: true,
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Pesquisar...",
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue.withOpacity(0.2),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.my_location,
        ),
      ),
    );
  }
}