class Produto {
  final String nome;
  final int quantidade;
  final double valor;

  Produto(
    this.nome,
    this.quantidade,
    this.valor,
  );

  @override
  String toString() {
    return "Produto{nome: $nome, quantidade: $quantidade, valor: $valor}";
  }
}
