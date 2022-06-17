import 'dart:async';
import 'package:bytebank/components/progress.dart';
import 'package:uuid/uuid.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transaction_auth_dialog.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  const TransactionForm({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();
  final String
  transactionId = const Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Transaction"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Visibility(
                visible: false,
                child: Progress(message: "Sending..."),
              ),
              Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24),
                  decoration: const InputDecoration(labelText: "Value"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text("Transfer"),
                    onPressed: () {
                      final double value = double.tryParse(_valueController.text) ?? 0;
                      showDialog(
                        context: context,
                        builder: (contextDialog) => TransactionAuthDialog(
                          onConfirm: (String password) {
                            final Transaction transactionCreated = Transaction(transactionId, value, widget.contact);
                            _save(transactionCreated, password, context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(Transaction transactionCreated, String password, BuildContext context) async {
    await _send(transactionCreated, password, context);
    _showSuccessfulMessage(context);
  }

  Future<void> _showSuccessfulMessage(BuildContext context) async {
    await showDialog(context: context, builder: (contextDialog) {
      return const SuccessDialog(message: "Successful transaction");
    });
    Navigator.pop(context);
  }

  Future<void> _send(Transaction transactionCreated, String password, BuildContext context) async {
    await _webClient.save(transactionCreated, password)
        .catchError((e) {
      _showFailureMessage(context, message: "Timeout submitting the transaction");
    }, test: (e) => e is TimeoutException)
        .catchError((e) {
      _showFailureMessage(context, message: e.message);
    }, test: (e) => e is HttpException).catchError((e) {
      _showFailureMessage(context);
    }, test: (e) => e is Exception);

    _showSuccessfulMessage(context);
  }

  void _showFailureMessage(BuildContext context, {String message = "Unknown error"}) {
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(message);
    });
  }
}
