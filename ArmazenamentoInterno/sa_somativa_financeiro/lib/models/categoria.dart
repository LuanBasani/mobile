class Categoria {
  int? id;
  String nome;
  String tipo;


  Categoria ({
    this.id,
    required this.nome,
    required this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'],
      nome: map['nome'],
      tipo: map['tipo'],
    );
  }
}