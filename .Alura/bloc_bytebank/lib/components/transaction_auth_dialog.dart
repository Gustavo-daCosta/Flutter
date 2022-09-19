import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const TransactionAuthDialog({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Authenticate"),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        keyboardType: const TextInputType.numberWithOptions(),
        autofocus: true,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 64,
          letterSpacing: 24,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                widget.onConfirm(_passwordController.text);
                Navigator.pop(context);
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ],
    );
  }
}

