import 'package:contact/models/contact_model.dart';
import 'package:flutter/material.dart';

class EditorContactView extends StatelessWidget {
  final ContactModel? model;
  const EditorContactView({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          model == null ? "Novo Contato" : "Editar Contato",
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: model?.name,
                onSaved: (val) {
                  model?.name = val!;
                },
              ),
              TextFormField(
                initialValue: model?.phone,
                keyboardType: TextInputType.phone,
                onSaved: (val) {
                  model?.phone = val!;
                },
              ),
              TextFormField(
                initialValue: model?.email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) {
                  model?.email = val!;
                },
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}