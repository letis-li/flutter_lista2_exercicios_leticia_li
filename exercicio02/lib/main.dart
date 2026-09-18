import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Livro {
  final String titulo;
  final String autor;

  Livro({required this.titulo, required this.autor});
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatalogoLivros(),
    );
  }
}

class CatalogoLivros extends StatelessWidget {
  const CatalogoLivros({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Livro> livros = [
      Livro(titulo: 'Vidas Secas', autor: 'Graciliano Ramos'),
      Livro(titulo: 'Torto Arado', autor: 'Itamar Vieira Junior'),
      Livro(titulo: 'Mayombe', autor: 'Pepetela'),
      Livro(titulo: 'O Chamado de Cthulhu', autor: 'H. P. Lovecraft'),
      Livro(titulo: 'O mistério dos sete relógios', autor:'Agatha Christie'),
      Livro(titulo: 'Pegasus e o Fogo do Olimpo', autor:'Kate O Hearn'),
      Livro(titulo: 'O Elefante desaparece', autor:'Haruki Murakami'),
      Livro(titulo: 'E não sobrou nenhum', autor:'Agatha Christie'),
      Livro(titulo: 'Um estudo em vermelho', autor:'Arthur Conan Doyle'),
      Livro(titulo: 'O signo dos quatro', autor:'Arthur Conan Doyle'),
      Livro(titulo: 'O pequeno príncipe', autor:'Antoine de Saint-Exupéry'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Livros')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final Livro livro = livros[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.book, size: 35, color: Colors.green,),
              title: Text(
                livro.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(livro.autor),
            ),
          );
        },
      ),
    );
  }
}
