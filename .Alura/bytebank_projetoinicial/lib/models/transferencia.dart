class Transferencia {
  late double valor;
  late int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );

  @override
  String toString() {
    return "Transferencia{valor: $valor, numeroConta: $numeroConta}";
  }
}