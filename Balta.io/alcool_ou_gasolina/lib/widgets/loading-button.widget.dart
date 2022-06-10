import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function func;
  var text = "";

  LoadingButton({
    Key? key,
    required this.busy,
    required this.func,
    required this.invert,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return busy
      ? Container(
        alignment: Alignment.center,
        height: 50,
        child: const CircularProgressIndicator(backgroundColor: Colors.white,)
      )
      : Container(
      margin: const EdgeInsets.all(30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: invert ? Theme.of(context).primaryColor : Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(60),
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: invert ? Colors.white : Theme.of(context).primaryColor,
            fontSize: 30,
            fontFamily: "Big Shoulders Display",
          )
        ),
        onPressed: () => func(),
      ),
    );
  }
}