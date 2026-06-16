import 'package:flutter/material.dart';
import 'package:sa_somativa_financeiro/controllers/transacao_controller.dart';

class AddTransacaoScreen extends StatefulWidget {
  final int categoriaId;
  final String categoriaTipo;

  const AddTransacaoScreen({
    super.key,
    required this.categoriaId,
    required this.categoriaTipo,
  });

  @override
  State<AddTransacaoScreen> createState() => _AddTransacaoScreenState();
}

class _AddTransacaoScreenState extends State<AddTransacaoScreen> {
  final TransacaoController _controller = TransacaoController();

  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _descricaoController = TextEditingController();

  String _tipoSelecionado = 'despesa';
  DateTime _dataSelecionada = DateTime.now();

  @override
  void initState() {
    super.initState();

    if (widget.categoriaTipo == 'receita') {
      _tipoSelecionado = 'receita';
    }
  }

  Future<void> _selecionarData() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dataSelecionada = picked;
      });
    }
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;

    await _controller.addTransacao(
      categoriaId: widget.categoriaId,
      valor: double.parse(
        _valorController.text.replaceAll(',', '.'),
      ),
      descricao: _descricaoController.text.trim(),
      data: _dataSelecionada.toIso8601String().split('T')[0],
      tipo: _tipoSelecionado,
    );

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Transação'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    size: 60,
                    color: Colors.green,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _descricaoController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      prefixIcon: Icon(Icons.description),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Informe a descrição';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _valorController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)',
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Informe o valor';
                      }

                      final valor = double.tryParse(
                        v.replaceAll(',', '.'),
                      );

                      if (valor == null || valor <= 0) {
                        return 'Valor inválido';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  if (widget.categoriaTipo == 'ambos')
                    DropdownButtonFormField<String>(
                      value: _tipoSelecionado,
                      decoration: const InputDecoration(
                        labelText: 'Tipo',
                        prefixIcon: Icon(Icons.swap_vert),
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
                      ],
                      onChanged: (v) {
                        setState(() {
                          _tipoSelecionado = v!;
                        });
                      },
                    ),

                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _dataSelecionada
                                .toIso8601String()
                                .split('T')[0],
                          ),
                        ),
                        TextButton(
                          onPressed: _selecionarData,
                          child: const Text('Alterar'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _salvar,
                      icon: const Icon(Icons.save),
                      label: const Text(
                        'Salvar Transação',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _valorController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }
}