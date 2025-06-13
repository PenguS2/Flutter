import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView de Quadrados Coloridos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ColorGridScreen(),
    );
  }
}

class ColorGridScreen extends StatelessWidget {
  // Lista de cores e textos para os quadrados
  final List<Map<String, dynamic>> squares = [
    {'color': Colors.red[400], 'text': 'Vermelho', 'textColor': Colors.white},
    {'color': Colors.green[400], 'text': 'Verde', 'textColor': Colors.white},
    {
      'color': const Color.fromARGB(255, 115, 237, 253),
      'text': 'Azul',
      'textColor': Colors.white,
    },
    {'color': Colors.yellow[400], 'text': 'Amarelo', 'textColor': Colors.black},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quadrados Coloridos'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 colunas
          crossAxisSpacing: 16, // Espaçamento horizontal entre itens
          mainAxisSpacing: 16, // Espaçamento vertical entre itens
          childAspectRatio: 1, // Proporção quadrada (altura = largura)
          children: squares.map((square) {
            return Container(
              decoration: BoxDecoration(
                color: square['color'],
                borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  square['text'],
                  style: TextStyle(
                    color: square['textColor'],
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
