import 'package:flutter/material.dart';
import 'package:provider_bytebank/models/transferencia.dart';

class Transferencias with ChangeNotifier/*Provider*/ { 
  final List<Transferencia> _transferencias = [];
  List<Transferencia> get transferencias => _transferencias;

  //Transferencias({Key? key}) : super(key: key);

  void adicionar(Transferencia novaTransferencia) {
    transferencias.add(novaTransferencia);
    notifyListeners();
  }
}
