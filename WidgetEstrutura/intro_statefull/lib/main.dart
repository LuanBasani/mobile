// aplicativo usando StateFul ( com Mudança de Estado => ReBuild da Tela)

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // método que identifica as mudanças de estado e chama a reconstrução da tela
  @override
  State<MyApp> createState() => _MyAppState();
   //arrow function
}

//classe criada para construir a janela, toda ação é escrita aqui
class _MyAppState extends State<MyApp> {
  //variável para identificar o nº de clicks no botão
  int contador = 0;

  //build da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplicativo com StateFul - Contador"),),
      // Padding => espaçamento interno
      body: Padding(padding: EdgeInsets.all(8),
        // espaçamento em todos os lados de 8px
      child: Center(
        //container center => centraliza os elementos no meio da tela (lateral)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("N° de Clicks: $contador", style: TextStyle(fontSize: 20)),
            // adicionar um botão com texto
            ElevatedButton(
              onPressed: (){
                //adicionar setstate
                setState(() {
                  contador++; // adiciona o contador em +1
                });
              }, // Ação do botão (){} ou ()=>
              
              
              child: Text("Adicionar +1"))
          ],
        ),
      ),
      ),
    );
  }
}