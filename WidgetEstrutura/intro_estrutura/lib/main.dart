// tela para estudo dos widgets de exibição
// text, image, icon, entre outros

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    //configurações iniciais do App
    //router => rotas de navegação
    //home => pagina Inicial
    home: MyApp()
    //themeApp => (Claro/Escuro)
  )); // legal de colocar o material app no void main 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // estrutura da tela, onde os widgets de exibição serão colocados
  @override
  Widget build(BuildContext context) {
    return Scaffold( //elemento principal da tela
    //appBar => barra superior
    //drawer => menu lateral
    //bnbar => barra inferior
    //body => corpo da tela, onde os widgets de exibição serão colocados
    //floatingActionButton => botão flutuante
    //snakebar => mensagem temporária que aparece na parte inferior da tela
    appBar: AppBar(title: Text("Exemplos de Widget de exibição"),),
    //adicionar um elemento de Scroll para a tela
    body: SingleChildScrollView(
      // + usado para scroll de tela inteira
      child: Padding(
        padding: EdgeInsets.all(16.0),
        // Widget de Text
        child: Expanded(
          // + usado para scroll de parte da tela
          child: Column(
            children: [
              Text(
                "Explorando o Flutter", 
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue,),
              ),
              // dentro da column
              //adicionar uma image
              Image.network(
                // link URL de uma imagem
                "https://images.unsplash.com/photo-1726669638433-5a2fa8589bdc",
                height: 600,
                fit: BoxFit.contain,
              ),
              Image.asset("assets/img/miranha.avif",
                height: 600,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}