import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function()? callback;

  const Button({
    Key? key,
    required this.label,
    required this.callback,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 110,
      decoration: BoxDecoration(
        color: selected
        ? Theme.of(context).primaryColor
        : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: const Color(0xFFFDBF00),
        ),
      ),
      child: TextButton(
        onPressed: callback,
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}