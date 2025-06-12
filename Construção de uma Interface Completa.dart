import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Simples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Controlador para o TextField
  final TextEditingController _controller = TextEditingController();

  // Variável para armazenar o texto digitado
  String _textoExibido = 'Digite algo e clique no botão';

  // Função chamada quando o botão é pressionado
  void _exibirTexto() {
    setState(() {
      _textoExibido = _controller.text.isNotEmpty
          ? _controller.text
          : 'Você não digitou nada!';
    });

    // Opcional: limpar o campo após exibir
    _controller.clear();
  }

  @override
  void dispose() {
    // Limpar o controller quando o widget for removido
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aplicativo Simples'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de texto para entrada
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite algo',
                border: OutlineInputBorder(),
                hintText: 'Escreva aqui...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 20),

            // Botão para exibir o texto
            ElevatedButton(
              onPressed: _exibirTexto,
              child: Text('Exibir Texto'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 30),

            // Área para exibir o texto
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Texto Digitado:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _textoExibido,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
