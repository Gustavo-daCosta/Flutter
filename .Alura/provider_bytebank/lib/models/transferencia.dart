class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );

  String toStringValor() => "R\$ $valor";

  String toStringConta() => "Conta: $numeroConta";
}