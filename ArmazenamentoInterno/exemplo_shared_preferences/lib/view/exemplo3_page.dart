import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Exemplo3Page extends StatefulWidget {
  const Exemplo3Page({super.key});

  @override
  State<Exemplo3Page> createState() => _Exemplo3PageState();
}

class _Exemplo3PageState extends State<Exemplo3Page> {

  List<String> _tarefas = [];
  final TextEditingController _inputTarefa = TextEditingController(); // controlar o input de tarefas
  String nome = "";

  late SharedPreferences _prefs; // escopo late para inicializar depois
  //métodos
  @override
  void initState() {
    super.initState();
    _loadTarefas();
  }


  // método para carregar os dados do shared
  void _loadTarefas() async{

    //conectar o app ao shared
    _prefs = await SharedPreferences.getInstance();
    nome = _prefs.getString('nome') ?? ""; // se não tiver valor, retorna string vazia
    setState(() {
      _tarefas = _prefs.getStringList('tarefas+$nome') ?? []; // se não tiver valor, retorna lista vazia
    });

  }

  void _savePreferences() async{
    _prefs = await SharedPreferences.getInstance();
    nome = _prefs.getString('nome') ?? ""; // se não tiver valor, retorna string vazia
    await _prefs.setStringList('tarefas+$nome', _tarefas); // salva a lista de tarefas no shared
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de tarefas do $nome"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _inputTarefa,
              decoration: InputDecoration(
                labelText: "Digite sua tarefa...",
              ),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _tarefas.add(_inputTarefa.text.trim()); // adiciona a tarefa na lista
                  _savePreferences(); // salva as tarefas no shared
                  _inputTarefa.clear(); // limpa o campo de input
                });
            }, 
              child: Text("Adicionar Tarefa"),),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_tarefas[index]),
                      onLongPress: (){
                        setState(() {
                          _tarefas.removeAt(index); // remove a tarefa da lista
                          _savePreferences(); // salva as tarefas no shared
                        });
                      },
                    );
                  }
                )
              )
          ],
        ),
      ),
    );
  }
}