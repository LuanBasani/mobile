// Modelagem de dados 

class Nota {
  //Atributos
  final int? id; // permitir que a variavel seja nula
  // em um primeiro momento a váriavel é nula
  // somente qunando cair no db ira receber valor 

  final String titulo;
  final String conteudo;

  //construtor
  Nota({
    this.id,
    required this.titulo,
    required this.conteudo
  });

  // Métodos de serialização de dados (toMap() e fromMap())

  //toMap() => converter um obj da classe Nota para um map de DB ( inserir dados no DB )

  Map<String, dynamic> toMap() {
    return {
      'id': id, //mapeando as colunas do DB com os atributos da Classe Nota
      'titulo': titulo,
      'conteudo': conteudo
    };
  }

  //fromMap() => converter um map do DB para um obj da classe Nota ( ler dados do DB )  
  // para fazer o from vamos usar factory

  factory Nota.fromMap(Map<String, dynamic> map){
    return Nota(
      id: map['id'] as int, // se está voltando do DB, então já tem um id
      titulo: map['titulo'] as String,
      conteudo: map['conteudo'] as String
    );
  }

  // método para imprimir dados

  @override
  String toString() {
    return 'Nota{id: $id, titulo: $titulo, conteudo: $conteudo}';
  }


}