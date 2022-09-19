import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String message;

  const Progress({
    Key? key,
    this.message = "Loading",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
