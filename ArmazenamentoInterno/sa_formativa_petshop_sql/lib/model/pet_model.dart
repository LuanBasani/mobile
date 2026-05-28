class Pet{
  int? id; // pode ser nulo inicialmente => id será atribuído pelo banco de dados
  String nome;
  String raca;
  String nomeDono;
  String telefone;

  // construtors
  Pet({
    this.id,
    required this.nome,
    required this.raca,
    required this.nomeDono,
    required this.telefone,
  });

  //mapeamento de dados
  //tomap
  Map<String, dynamic> toMap() => {
      'id': id,
      'nome': nome,
      'raca': raca,
      'nomeDono': nomeDono,
      'telefone': telefone,
  };

  //frommap
  factory Pet.fromMap(Map<String, dynamic> map) => Pet(
        id: map['id'],
        nome: map['nome'],
        raca: map['raca'],
        nomeDono: map['nomeDono'],
        telefone: map['telefone'],
      );
}