import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Refatorar classe
// pra que existe uma classe inteira só pra chamar o "NameView()"?
class NameContainer extends BlocContainer {
  const NameContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  NameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // agora esta abordagem não tem problemas
    // pois não vamos fazer um rebuild quando o estado é alterado
    _nameController.text = context.read<NameCubit>().state;
    // BlocBuilder<NameCubit, String>(
    //   builder: (context, state) {
    //     return Text(state.toString());
    //   },
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change name"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Desired name",
              ),
              style: const TextStyle(fontSize: 24)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () { 
                    final String name = _nameController.text;
                    context.read<NameCubit>().change(name);
                    Navigator.pop(context);
                  },
                  child: const Text("Change")
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}