import 'package:flutter/material.dart';
import 'package:sa_somativa_financeiro/controllers/transacao_controller.dart';
import 'package:sa_somativa_financeiro/models/categoria.dart';
import 'package:sa_somativa_financeiro/models/transacao.dart';
import 'package:sa_somativa_financeiro/view/add_transacao_screen.dart';

class CategoriaDetailScreen extends StatefulWidget {
  final Categoria categoria;

  const CategoriaDetailScreen({
    super.key,
    required this.categoria,
  });

  @override
  State<CategoriaDetailScreen> createState() =>
      _CategoriaDetailScreenState();
}

class _CategoriaDetailScreenState
    extends State<CategoriaDetailScreen> {
  final TransacaoController _transacaoController =
      TransacaoController();

  List<Transacao> _transacoes = [];

  double _totalReceitas = 0;
  double _totalDespesas = 0;

  @override
  void initState() {
    super.initState();
    _loadTransacoes();
  }

  Future<void> _loadTransacoes() async {
    final transacoes = await _transacaoController.getTransacoes(
      widget.categoria.id!,
    );

    setState(() {
      _transacoes = transacoes;

      _totalReceitas =
          _transacaoController.calcularTotal(
        transacoes,
        'receita',
      );

      _totalDespesas =
          _transacaoController.calcularTotal(
        transacoes,
        'despesa',
      );
    });
  }

  void _deleteTransacao(int id) async {
    await _transacaoController.deleteTransacao(id);
    _loadTransacoes();
  }

  Widget _buildResumoCard(
    String titulo,
    double valor,
    Color cor,
    IconData icon,
  ) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                icon,
                color: cor,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'R\$ ${valor.toStringAsFixed(2)}',
                style: TextStyle(
                  color: cor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final saldo = _totalReceitas - _totalDespesas;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria.nome),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildResumoCard(
                  'Receitas',
                  _totalReceitas,
                  Colors.green,
                  Icons.trending_up,
                ),

                const SizedBox(width: 8),

                _buildResumoCard(
                  'Despesas',
                  _totalDespesas,
                  Colors.red,
                  Icons.trending_down,
                ),

                const SizedBox(width: 8),

                _buildResumoCard(
                  'Saldo',
                  saldo,
                  saldo >= 0
                      ? Colors.blue
                      : Colors.orange,
                  Icons.account_balance_wallet,
                ),
              ],
            ),
          ),

          const Divider(),

          Expanded(
            child: _transacoes.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma transação registrada.',
                    ),
                  )
                : ListView.builder(
                    itemCount: _transacoes.length,
                    itemBuilder: (context, index) {
                      final t = _transacoes[index];

                      return Card(
                        margin:
                            const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.all(12),

                          leading: CircleAvatar(
                            backgroundColor:
                                t.tipo == 'receita'
                                    ? Colors.green
                                        .shade100
                                    : Colors.red
                                        .shade100,
                            child: Icon(
                              t.tipo == 'receita'
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color:
                                  t.tipo == 'receita'
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),

                          title: Text(
                            t.descricao,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(t.data),

                          trailing: Row(
                            mainAxisSize:
                                MainAxisSize.min,
                            children: [
                              Text(
                                'R\$ ${t.valor.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color:
                                      t.tipo ==
                                              'receita'
                                          ? Colors.green
                                          : Colors.red,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () =>
                                    _deleteTransacao(
                                  t.id!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTransacaoScreen(
                categoriaId:
                    widget.categoria.id!,
                categoriaTipo:
                    widget.categoria.tipo,
              ),
            ),
          );

          _loadTransacoes();
        },
        icon: const Icon(Icons.add),
        label: const Text('Transação'),
      ),
    );
  }
}