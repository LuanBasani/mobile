import 'package:sa_somativa_financeiro/models/transacao.dart';
import 'package:sa_somativa_financeiro/services/database_helper.dart';

class TransacaoController {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<List<Transacao>> getTransacoes(int categoriaId) async {
    return await _db.getTransacoesByCategoria(categoriaId);
  }

  Future<void> addTransacao({
    required int categoriaId,
    required double valor,
    required String descricao,
    required String data,
    required String tipo,
  }) async {
    final transacao = Transacao(
      categoriaId: categoriaId,
      valor: valor,
      descricao: descricao,
      data: data,
      tipo: tipo,
    );
    await _db.insertTransacao(transacao);
  }

  Future<void> deleteTransacao(int id) async {
    await _db.deleteTransacao(id);
  }

  double calcularTotal(List<Transacao> transacoes, String tipo) {
    return transacoes
        .where((t) => t.tipo == tipo)
        .fold(0.0, (soma, t) => soma + t.valor);
  }
}