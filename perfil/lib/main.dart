// Tela de Perfil - usando Column, Row, Stack e Container

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
          actions: [
            // CORREÇÃO 1: Icon dentro de Padding para aparecer certo na AppBar
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.notifications_none),
            )
          ],
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ─── CARD PRETO DE PERFIL ──────────────────────
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [

                    Container(
                      width: 90,
                      height: 90,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enzo Basani",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "luanbasani@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height: 16),

              // ─── LINHA COM 3 NÚMEROS ───────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 100,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("5", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Pedidos"),
                      ],
                    ),
                  ),

                  Container(
                    width: 100,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("5", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Favoritos"),
                      ],
                    ),
                  ),

                  Container(
                    width: 100,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(5),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("5", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("Cupons"),
                      ],
                    ),
                  ),

                ],
              ),

              SizedBox(height: 16),

              // ─── ABAS ──────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.white,
                    child: Text("Pedidos", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),

                  SizedBox(width: 4),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.grey,
                    child: Text("Favoritos"),
                  ),

                  SizedBox(width: 4),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.grey,
                    child: Text("Endereços"),
                  ),

                ],
              ),

              SizedBox(height: 20),

              // ─── TÍTULO RECENTES ───────────────────────────
              Text(
                "Recentes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 12),

              // ─── CARD DE PEDIDO 1 ──────────────────────────
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(width: 60, height: 60, color: Colors.grey[300]),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tenis", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("#2105 · 02 mar", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("R\$ 112", style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text("Entregue", style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ─── CARD DE PEDIDO 2 ──────────────────────────
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(width: 60, height: 60, color: Colors.grey[300]),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tenis", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("#2105 · 02 mar", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("R\$ 112", style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text("Entregue", style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ─── CARD DE PEDIDO 3 ──────────────────────────
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(width: 60, height: 60, color: Colors.grey[300]),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tenis", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("#2105 · 02 mar", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("R\$ 112", style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text("Entregue", style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

        // ─── MENU INFERIOR ─────────────────────────────────
        // CORREÇÃO 2: selectedItemColor obrigatório quando tem 4+ itens
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          selectedItemColor: Colors.black, // cor do ícone selecionado
          unselectedItemColor: Colors.grey, // cor dos outros ícones
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Carrinho"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Perfil"),
          ],
        ),

      ),
    );
  }
}