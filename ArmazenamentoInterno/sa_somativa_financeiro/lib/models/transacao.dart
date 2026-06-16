class Transacao {
  int? id;
  int categoriaId;
  double valor;
  String data;
  String descricao;
  String tipo;

  Transacao({
    this.id,
    required this.categoriaId,
    required this.valor,
    required this.data,
    required this.descricao,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoria_id': categoriaId,
      'valor': valor,
      'data': data,
      'descricao': descricao,
      'tipo': tipo,
    };
  }

  factory Transacao.fromMap(Map<String, dynamic> map) {
    return Transacao(
      id: map['id'],
      categoriaId: map['categoria_id'],
      valor: map['valor'],
      data: map['data'],
      descricao: map['descricao'],
      tipo: map['tipo'],
    );
  }
}