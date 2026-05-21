import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:exemplo_shared_preferences/main.dart';

class Exemplo2Page extends StatefulWidget {
  const Exemplo2Page({super.key});

  @override
  State<Exemplo2Page> createState() => _Exemplo2PageState();
}

class _Exemplo2PageState extends State<Exemplo2Page> {
  late SharedPreferences _prefs; // escopo late para inicializar depois

  bool _darkmode = false;

  // métodos de conexão shared_preferences

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // método para buscar dados no shared
  void _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkmode = _prefs.getBool('darkmode') ?? false; // se não tiver valor, retorna false
    });
  }

  // método para salvar dados no shared
  void savePreferences() async {
    setState(() {
      _darkmode = !_darkmode;
    });

    await _prefs.setBool('darkmode', _darkmode);

    MyApp.of(context)?.atualizarTema(_darkmode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modo Escuro com Shared Preferences"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tema Atual: ${_darkmode ? "Escuro" : "Claro"}", style: TextStyle(fontSize: 20),),
            Switch(
              value: _darkmode, 
              onChanged: (_) => savePreferences()), // switch para alterar o tema
          ],
        ),
      ),
    );
  }
}