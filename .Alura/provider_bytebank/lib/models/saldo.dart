import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adicionar(double valor) {
    this.valor += valor;
    notifyListeners();
  }

  void subtrair(double valor) {
    this.valor -= valor;
    notifyListeners();
  }

  @override
  String toString() {
    return "R\$ $valor";
  }
}