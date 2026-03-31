// tela com elementos de formulário para interação do usuário
// textField -> entrada de dados
// checkbox -> seleção de opções
// radio button ->  uma única opção
// slider -> barra de seleção
//switch -> botão de alternância
// dropdown => menu suspenso

// usar elemento form para validação de campos

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  // atributos (nome,email,senha,validação de senha, termos de uso(switch), sexo(radio), idade(slider), interesses(checkbox), interesses (checkbox), cidade(dropdown))
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _confirmarSenha = "";
  bool _termosAceitos = false;
  String _sexo = "Masculino";
  double _idade = 18;
  List<String> _interesses = [];
  String _cidade = "Americana";

  //chave global de validação do formulário
  final formKey = GlobalKey<FormState>(); // formulário somente será enviado se a chave estiver validada



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Cadastro"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey, //chave de validação
          child: SingleChildScrollView(
            child: Column(
              children: [
                //campo do nome
                TextFormField(
                  //validação do campo
                  validator: (value) => value == null || value.isEmpty ? ,
                )
              ],
            ),
          ),
        ),
        ),
    );
  }
}