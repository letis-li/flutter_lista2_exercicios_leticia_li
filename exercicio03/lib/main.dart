import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Aluno {
  final String nome;
  final double nota;

  Aluno({
    required this.nome,
    required this.nota,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaAlunos(),
    );
  }
}

class ListaAlunos extends StatelessWidget {
  const ListaAlunos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Aluno> alunos = [
      Aluno(
        nome: 'Leticia Li',
        nota: 8.5,
      ),
      Aluno(
        nome: 'Eduarda Bueno',
        nota: 10.0,
      ),
      Aluno(
        nome: 'Milena Neves',
        nota: 9.0,
      ),
      Aluno(
        nome: 'Leonardo Zamp',
        nota: 8.5,
      ),
      Aluno(
        nome: 'Eduardo Taborda',
        nota: 8.5,
      ),
      Aluno(
        nome: 'Eduardo Cortez',
        nota: 7.5,
      ),
      Aluno(
        nome: 'Rafael Benaia',
        nota: 10.0,
      ),
      Aluno(
        nome: 'Guilherme Henrique',
        nota: 9.5,
      ),
      Aluno(
        nome: 'Pedro Henrique',
        nota: 9.5,
      ),
      Aluno(
        nome: 'Mariana Silva',
        nota: 5.5,
      ),
    ];

    final List<Color> cores = [
      Colors.pinkAccent,
      Colors.pinkAccent,
      Colors.pinkAccent,
      Colors.blueAccent,
      Colors.blueAccent,
      Colors.blueAccent,
      Colors.blueAccent,
      Colors.blueAccent,
      Colors.blueAccent,
       Colors.pinkAccent,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Alunos'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alunos.length,
        itemBuilder: (context, index) {
          final Aluno aluno = alunos[index];

          return Card(
            child: ListTile(
              leading: Icon(
                Icons.school,
                size: 35, color: cores[index],
              ),
              title: Text(
                aluno.nome,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Nota: ${aluno.nota}',
              ),
            ),
          );
        },
      ),
    );
  }
}