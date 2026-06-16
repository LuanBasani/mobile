# 💰 Controle Financeiro Pessoal

App mobile desenvolvido em Flutter com persistência local via SQLite.

## 📋 Funcionalidades

- Cadastro de categorias (Alimentação, Transporte, Lazer, etc.)
- Visualização de receitas e despesas por categoria
- Registro de transações com valor, descrição, data e tipo
- Persistência local com SQLite (dados mantidos ao reiniciar)

## 🏗️ Arquitetura

MVC (Model - View - Controller)

```
lib/
├── models/          # Estrutura de dados
├── views/           # Telas da aplicação
├── controllers/     # Lógica de negócio
├── database/        # Configuração do SQLite
└── main.dart
```

## 🚀 Como rodar

1. Clone o repositório
2. Instale as dependências:
   ```bash
   flutter pub get
   ```
3. Rode o app:
   ```bash
   flutter run
   ```

## 📦 Dependências

- [sqflite](https://pub.dev/packages/sqflite) — banco de dados SQLite
- [path](https://pub.dev/packages/path) — localização do banco no dispositivo

## 🛠️ Tecnologias

- Flutter / Dart
- SQLite (sqflite)

## 👤 Autor

Luan Basani — SENAI Americana — ADS