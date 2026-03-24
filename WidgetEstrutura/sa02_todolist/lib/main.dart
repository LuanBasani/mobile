//função principal ( faz o aplicativo rodar)
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, //remove a flag do debug
    home: ToDoList(),
  ));
}


// st - snipets (atalhos para código)

//janela do aplicativo
//1° class identifica a mudança de estado => chama o build
class ToDoList extends StatefulWidget {
  const ToDoList({super.key});


  @override
  State<ToDoList> createState() => _ToDoListState();
}

//2° class = lógica da construção da janela
class _ToDoListState extends State<ToDoList> {
  //atributos
  // final = recebe o valor e n altera mais
  // _ o uso do underline, transforma a variável em private
  final TextEditingController _tarefaController = TextEditingController(); // pega o valor do input
  final List<Map<String,dynamic>> _tarefas = []; // lista do tipo coleção (chave,valor)
  //métodos 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas"),centerTitle: true,),// centraliza o texto no meio da AppBar
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            //input para add novas tarefas
            TextField(
              controller: _tarefaController, // passa o valor do texto para o controller
              decoration: InputDecoration(
                labelText: "Digite uma Tarefa"
              ),
            ),
            SizedBox(height: 10,), // espaçamento de altura
            ElevatedButton(
              onPressed: _adicionarTarefa, 
              child: Text("Adicionar Tarefs")
            ),
            //campo para listar as tarefas
            Expanded(
              //listar as tarefas da coleção
              child: ListView.builder(
                itemCount: _tarefas.length, //conta o nº de item na lista
                itemBuilder: (context,index)=>
                ListTile(
                  title: Text(_tarefas[index]["titulo"], style: TextStyle(
                    decoration: _tarefas[index]["concluida"] ? TextDecoration.lineThrough : null
                  ),
                  ),
                  leading: Checkbox( // permite mudar o valor da tarefa para concluida ou nao
                    value: _tarefas[index]["concluida"], 
                    onChanged: (bool ? valor)=>setState(() {
                      _tarefas[index]["concluida"] = valor!;
                    }),
                ),
              )
            ),
            ),
          ],
        ),
      ),
    );
  }
  //método para adicionar tarefa na lista
  void _adicionarTarefa() {
    if(_tarefaController.text.trim().isNotEmpty){
      setState(() {
        _tarefas.add({"titulo": _tarefaController.text, "concluida":false});
        //limpar o campo do input
        _tarefaController.clear();
      });
    }
  }
}