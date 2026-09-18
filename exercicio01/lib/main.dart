import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listaLinguagens(),
    );
  }
}

class listaLinguagens extends StatelessWidget {
  const listaLinguagens({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> linguagens = [
      'Dart',
      'Java',
      'Python',
      'JavaScript',
      'C',
      'C++',
      'C#',
      'PHP',
      'Dart',
      'Java',
      'Python',
      'JavaScript',
      'C',
      'C++',
      'C#',
      'PHP',
      'Dart',
      'Java',
      'Python',
      'JavaScript',
      'C',
      'C++',
      'C#',
      'PHP',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Linguagens')),
      body: ListView.builder(
        itemCount: linguagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.computer),
            title: Text(linguagens[index]),
          );
        },
      ),
    );
  }
}
