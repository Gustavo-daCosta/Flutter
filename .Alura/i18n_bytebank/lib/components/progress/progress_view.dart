import 'package:flutter/material.dart';
import 'package:i18n_bytebank/components/progress/progress.dart';

class ProgressView extends StatelessWidget {
  final String message;

  const ProgressView({this.message = "Sending...", Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Processing"),
      ),
      body: Progress(message: message),
    );
  }
}
