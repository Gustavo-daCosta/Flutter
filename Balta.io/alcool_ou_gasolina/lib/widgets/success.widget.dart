import 'package:flutter/material.dart';
import 'loading-button.widget.dart';

class Sucess extends StatelessWidget {
  var result = "";
  Function reset;

  Sucess({
    Key? key,
    required this.result,
    required this.reset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50,),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          LoadingButton(
            busy: false,
            func: reset,
            text: "CALCULAR NOVAMENTE",
            invert: true,
          )
        ],
      ),
    );
  }
}