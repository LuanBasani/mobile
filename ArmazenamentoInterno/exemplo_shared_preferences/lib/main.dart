import 'package:exemplo_shared_preferences/view/exemplo1_page.dart';
import 'package:exemplo_shared_preferences/view/exemplo2_page.dart';
import 'package:exemplo_shared_preferences/view/exemplo3_page.dart';
import 'package:exemplo_shared_preferences/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

// bota modo claro e escuro
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _darkmode = false;

  @override
  void initState() {
    super.initState();
    carregarTema();
  }

  Future<void> carregarTema() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _darkmode = prefs.getBool('darkmode') ?? false;
    });
  }

  void atualizarTema(bool valor) {
    setState(() {
      _darkmode = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Salve",
      debugShowCheckedModeBanner: false,

      themeMode: _darkmode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      routes: {
        "/tela1": (context) => const Exemplo1Page(),
        "/tela2": (context) => const Exemplo2Page(),
        "/tela3": (context) => const Exemplo3Page(),
      },

      home: const HomePage(),
    );
  }
}