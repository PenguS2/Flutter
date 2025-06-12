import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista com Ícones',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListaComIcones(),
    );
  }
}

class ListaComIcones extends StatelessWidget {
  final List<Map<String, dynamic>> itens = [
    {'icone': Icons.home, 'titulo': 'Início'},
    {'icone': Icons.settings, 'titulo': 'Configurações'},
    {'icone': Icons.person, 'titulo': 'Perfil'},
    {'icone': Icons.notifications, 'titulo': 'Notificações'},
    {'icone': Icons.email, 'titulo': 'Mensagens'},
    {'icone': Icons.favorite, 'titulo': 'Favoritos'},
    {'icone': Icons.history, 'titulo': 'Histórico'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Itens')),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(itens[index]['icone'], color: Colors.blue),
            title: Text(itens[index]['titulo']),
            onTap: () {
              // Ação quando o item é clicado
              print('${itens[index]['titulo']} foi selecionado');
            },
          );
        },
      ),
    );
  }
}
