// arquivo principal da aplicação

//sempre começa com um void main

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MaterialApp(
    home: // estrutura maxima de janela
      Scaffold(
        appBar: AppBar(title: Text("Meu primeiro aplicativo insanamente INSANO"),),
        body: Center(
          child: ElevatedButton(onPressed: (){
            Fluttertoast.showToast(msg:"Chore imediatamente",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,);
          },
          child: Text("CEBOLA")),
        ),
      ),
  ));

}