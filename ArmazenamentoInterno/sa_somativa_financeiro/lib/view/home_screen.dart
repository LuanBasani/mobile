import 'package:flutter/material.dart';
import 'package:sa_somativa_financeiro/controllers/categoria_controller.dart';
import 'package:sa_somativa_financeiro/models/categoria.dart';
import 'package:sa_somativa_financeiro/services/database_helper.dart';
import 'package:sa_somativa_financeiro/view/categoria_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoriaController _controller = CategoriaController();

  List<Categoria> _categorias = [];
  double _totalReceitas = 0;
  double _totalDespesas = 0;

  @override
  void initState() {
    super.initState();
    _loadCategorias();
  }

  Future<void> _loadCategorias() async {
    final categorias = await _controller.getCategorias();
    final todasTransacoes = await DatabaseHelper.instance.getAllTransacoes();

    setState(() {
      _categorias = categorias;

      _totalReceitas = todasTransacoes
          .where((t) => t.tipo == 'receita')
          .fold(0.0, (soma, t) => soma + t.valor);

      _totalDespesas = todasTransacoes
          .where((t) => t.tipo == 'despesa')
          .fold(0.0, (soma, t) => soma + t.valor);
    });
  }

  Future<void> _zerarValores() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Zerar Valores'),
        content: const Text(
          'Deseja apagar todas as transações?\n\nAs categorias serão mantidas.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Apagar'),
          ),
        ],
      ),
    );

    if (confirmar != true) return;

    final db = await DatabaseHelper.instance.database;

    await db.delete('transacoes');

    await _loadCategorias();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Valores zerados com sucesso!'),
      ),
    );
  }

  void _showAddCategoriaDialog() {
    final nomeController = TextEditingController();
    String tipoSelecionado = 'ambos';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova Categoria'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 12),
            StatefulBuilder(
              builder: (context, setStateDialog) {
                return DropdownButtonFormField<String>(
                  value: tipoSelecionado,
                  decoration: const InputDecoration(
                    labelText: 'Tipo',
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'receita',
                      child: Text('Receita'),
                    ),
                    DropdownMenuItem(
                      value: 'despesa',
                      child: Text('Despesa'),
                    ),
                    DropdownMenuItem(
                      value: 'ambos',
                      child: Text('Ambos'),
                    ),
                  ],
                  onChanged: (value) {
                    setStateDialog(() {
                      tipoSelecionado = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nomeController.text.trim().isEmpty) return;

              await _controller.addCategoria(
                nomeController.text.trim(),
                tipoSelecionado,
              );

              Navigator.pop(context);
              _loadCategorias();
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  void _deleteCategoria(int id) async {
    await _controller.deleteCategoria(id);
    _loadCategorias();
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
                size: 30,
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
        title: const Text('💰 Controle Financeiro'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services),
            tooltip: 'Zerar Valores',
            onPressed: _zerarValores,
          ),
        ],
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
                  saldo >= 0 ? Colors.blue : Colors.orange,
                  Icons.account_balance_wallet,
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: _categorias.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma categoria cadastrada.',
                    ),
                  )
                : ListView.builder(
                    itemCount: _categorias.length,
                    itemBuilder: (context, index) {
                      final categoria = _categorias[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: const Icon(Icons.category),
                          ),
                          title: Text(
                            categoria.nome,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(categoria.tipo),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () =>
                                _deleteCategoria(categoria.id!),
                          ),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CategoriaDetailScreen(
                                  categoria: categoria,
                                ),
                              ),
                            );

                            _loadCategorias();
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddCategoriaDialog,
        icon: const Icon(Icons.add),
        label: const Text('Categoria'),
      ),
    );
  }
}