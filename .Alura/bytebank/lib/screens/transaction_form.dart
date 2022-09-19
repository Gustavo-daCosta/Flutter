import 'dart:async';
import 'dart:core';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:bytebank/components/progress.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

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
  final String transactionId = const Uuid().v4();
  bool _sending = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("New Transaction"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                visible: _sending,
                child: const Progress(message: "Sending..."),
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
    setState(() {_sending = true;});
    await _send(transactionCreated, password, context);
    setState(() {_sending = false;});
  }

  Future<void> _showSuccessfulMessage(BuildContext context) async {
    await showDialog(context: context, builder: (context) {
      return const SuccessDialog(message: "Successful transaction");
    });
    Navigator.pop(context);
  }

  Future<void> _send(Transaction transactionCreated, String password, BuildContext context) async {
    try {
      await _webClient.save(transactionCreated, password).whenComplete(() {
        setState(() {_sending = false;});
      });
      _showSuccessfulMessage(context);
    } on TimeoutException catch (e) {
      if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
        FirebaseCrashlytics.instance.setCustomKey("Exception", e.toString());
        FirebaseCrashlytics.instance.setCustomKey(
            "http_body", transactionCreated.toString(),
        );
        FirebaseCrashlytics.instance.recordError(e, null);
      }
      _showFailureMessage(context, message: "Timeout submitting the transaction");
    } on HttpException catch (e) {
      if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
        FirebaseCrashlytics.instance.setCustomKey("Exception", e.toString());
        FirebaseCrashlytics.instance.setCustomKey("http_code", e.statusCode);
        FirebaseCrashlytics.instance.setCustomKey("http_body", transactionCreated.toString());
        FirebaseCrashlytics.instance.recordError(e, null);
      }
      _showFailureMessage(context, message: e.message);
    } on Exception catch (e) {
      if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
        FirebaseCrashlytics.instance.setCustomKey("Exception", e.toString());
        FirebaseCrashlytics.instance.setCustomKey("http_body", transactionCreated.toString());
        FirebaseCrashlytics.instance.recordError(e, null);
      }
      _showFailureMessage(context);
    }
  }
  
  void _showFailureMessage(BuildContext context, {String message = "Unknown error"}) {
    // GIFFY DIALOG
    showDialog(
      context: context,
      builder: (test) => NetworkGiffyDialog(
        image: Image.asset("images/error.gif"),
        title: const Text(
          "OPS...",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        description: Text(
          message,
          textAlign: TextAlign.center,
        ),
        entryAnimation: EntryAnimation.BOTTOM,
        onCancelButtonPressed: () {Navigator.pop(context);},
        onOkButtonPressed: () {Navigator.pop(context);},
      ),
    );

    // TOAST
    //showToast(message);

    // SNACK BAR
    // final SnackBar snackBar = SnackBar(content: Text(message));
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // SHOW DIALOG
    // showDialog(context: context, builder: (contextDialog) {
    //   return FailureDialog(message);
    // });
  }

  void showToast(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(msg: msg, gravity: gravity);
  }
}
