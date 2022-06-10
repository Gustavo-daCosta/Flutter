import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'input.widget.dart';
import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = MoneyMaskedTextController();
  var alcCtrl = MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;

  SubmitForm({
    Key? key,
    required this.gasCtrl,
    required this.alcCtrl,
    required this.busy,
    required this.submitFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Gasolina",
            ctrl: gasCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Álcool",
            ctrl: alcCtrl,
          ),
        ),
        const SizedBox(height: 25,),
        LoadingButton(
          busy: busy,
          func: submitFunc,
          text: "CALCULAR",
          invert: false
        ),
      ],
    );
  }
}