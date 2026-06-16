import 'package:sa_somativa_financeiro/models/categoria.dart';
import 'package:sa_somativa_financeiro/services/database_helper.dart';

class CategoriaController {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<List<Categoria>> getCategorias() async {
    return await _db.getAllCategorias();
  }

  Future<void> addCategoria(String nome, String tipo) async {
    final categoria = Categoria(nome: nome, tipo: tipo);
    await _db.insertCategoria(categoria);
  }

  Future<void> updateCategoria(Categoria categoria) async {
    await _db.updateCategoria(categoria);
  }

  Future<void> deleteCategoria(int id) async {
    await _db.deleteCategoria(id);
  }
}