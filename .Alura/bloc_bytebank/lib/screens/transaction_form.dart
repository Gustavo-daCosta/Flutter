import 'dart:async';
import 'dart:core';
import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/error.dart';
import 'package:bytebank/components/progress.dart';
import 'package:uuid/uuid.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';
//import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transaction_auth_dialog.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TransactionFormState {
  const TransactionFormState();
}

@immutable
class ShowFormState extends TransactionFormState {
  const ShowFormState();
}

@immutable
class SendingState extends TransactionFormState {
  const SendingState();
}

@immutable
class SentState extends TransactionFormState {
  const SentState();
}

@immutable
class FatalErrorFormState extends TransactionFormState {
  final String message;

  const FatalErrorFormState({this.message = "Unknow Error"});
}

class TransactionFormCubit extends Cubit<TransactionFormState> {
  final TransactionWebClient _webClient = TransactionWebClient();

  TransactionFormCubit() : super(const ShowFormState());

  void save(BuildContext context, String password, Transaction transactionCreated) async {
    emit(const SendingState());
    await _send(context, transactionCreated, password);
  }

  Future<void> _send(BuildContext context, Transaction transactionCreated, String password) async {
    try {
      await _webClient.save(transactionCreated, password).then((value) => emit(const SentState()));
    } on TimeoutException {
      emit(const FatalErrorFormState(message: "Timeout submitting the transaction"));
    } on HttpException catch (e) {
      emit(FatalErrorFormState(message: e.message));
    } on Exception {
      emit(const FatalErrorFormState());
    }
  }
}

class TransactionFormContainer extends BlocContainer {
  final Contact contact;

  const TransactionFormContainer(
    this.contact,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionFormCubit>(
      create: (BuildContext context) {
        return TransactionFormCubit();
      },
      child: BlocListener<TransactionFormCubit, TransactionFormState>(
        listener: (context, state) {
          if (state is SentState) {
            Navigator.pop(context);
          }
        },
        child: TransactionForm(contact),
      ),
    );
  }
}

class TransactionForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();
  final String transactionId = const Uuid().v4();
  final Contact contact;

  TransactionForm(
    this.contact,
    {Key? key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
      builder: (context, state) {
        if (state is ShowFormState) {
          return _BasicForm(contact, _valueController, transactionId,);
        }
        if (state is SendingState || state is SentState) {
          return const ProgressView();
        }
        if (state is FatalErrorFormState) {
          return ErrorView(state.message);
        }
        return const ErrorView("Erro desconhecido");
       }
    );
  }
  /*
  Future<void> _showSuccessfulMessage(BuildContext context) async {
    await showDialog(context: context, builder: (context) {
      return const SuccessDialog(message: "Successful transaction");
    });
    Navigator.pop(context);
  }

  void _showFailureMessage(BuildContext context, {String message = "Unknown error"}) {
    // GIFFY DIALOG
    /*showDialog(
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
    );*/

    // TOAST
    //showToast(message);

    // SNACK BAR
    // final SnackBar snackBar = SnackBar(content: Text(message));
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // SHOW DIALOG
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(message);
    });
  }

  //void showToast(String msg, {ToastGravity gravity = ToastGravity.BOTTOM}) {
  //  Fluttertoast.showToast(msg: msg, gravity: gravity);
  //}
*/
}

class _BasicForm extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Contact contact;
  final TextEditingController _valueController;
  final String transactionId;

  _BasicForm(
    this.contact,
    this._valueController,
    this.transactionId,
    {Key? key}
  ) : super(key: key);

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
              Text(
                contact.name,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  contact.accountNumber.toString(),
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
                            final Transaction transactionCreated = Transaction(transactionId, value, contact);
                            BlocProvider.of<TransactionFormCubit>(context).save(context, password, transactionCreated);
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
}