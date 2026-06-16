import 'package:path/path.dart';
import 'package:sa_somativa_financeiro/models/categoria.dart';
import 'package:sa_somativa_financeiro/models/transacao.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();
  
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('finance.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE categorias (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        tipo TEXT NOT NULL
      )
      '''
    );
    
    await db.execute('''
      CREATE TABLE transacoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        categoria_id INTEGER NOT NULL,
        valor REAL NOT NULL,
        descricao TEXT NOT NULL,
        data TEXT NOT NULL,
        tipo TEXT NOT NULL,
        FOREIGN KEY (categoria_id) REFERENCES categorias(id)
      )
    ''');
  }

  Future<int> insertCategoria(Categoria categoria) async{
    final db = await database;
    return await db.insert('categorias', categoria.toMap());
  }

  Future<List<Categoria>> getAllCategorias() async {
    final db = await instance.database;
    final result = await db.query('categorias');
    return result.map((map) => Categoria.fromMap(map)).toList();
  }
  
  Future<List<Transacao>> getAllTransacoes() async {
  final db = await instance.database;
  final result = await db.query('transacoes');
  return result.map((map) => Transacao.fromMap(map)).toList();
}

  Future<int> updateCategoria(Categoria categoria) async {
    final db = await instance.database;
    return await db.update(
      'categorias',
      categoria.toMap(),
      where: 'id = ?',
      whereArgs: [categoria.id],
    );
  }

  Future<int> deleteCategoria(int id) async {
    final db = await instance.database;
    return await db.delete('categorias', where: 'id = ?', whereArgs: [id]);
  }

  // TRANSACOES
  Future<int> insertTransacao(Transacao transacao) async {
    final db = await instance.database;
    return await db.insert('transacoes', transacao.toMap());
  }

  Future<List<Transacao>> getTransacoesByCategoria(int categoriaId) async {
    final db = await instance.database;
    final result = await db.query(
      'transacoes',
      where: 'categoria_id = ?',
      whereArgs: [categoriaId],
    );
    return result.map((map) => Transacao.fromMap(map)).toList();
  }

  Future<int> deleteTransacao(int id) async {
    final db = await instance.database;
    return await db.delete('transacoes', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}