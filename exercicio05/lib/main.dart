import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Produto {
  final String nome;
  final double preco;
  final int quantidade;

  Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EstoqueSimples(),
    );
  }
}

class EstoqueSimples extends StatefulWidget {
  const EstoqueSimples({super.key});

  @override
  State<EstoqueSimples> createState() => _EstoqueSimplesState();
}

class _EstoqueSimplesState extends State<EstoqueSimples> {
  final TextEditingController nome = TextEditingController();
  final TextEditingController preco = TextEditingController();
  final TextEditingController quantidade = TextEditingController();

  final List<Produto> produtos = [];

  void adicionarProduto() {
    final String nomeProduto = nome.text.trim();
    final double precoProduto = double.tryParse(preco.text) ?? 0;
    final int quantidadeProduto = int.tryParse(quantidade.text) ?? 0;

    if (nomeProduto.isEmpty || precoProduto <= 0) {
      return;
    }

    setState(() {
      produtos.add(
        Produto(
          nome: nomeProduto,
          preco: precoProduto,
          quantidade: quantidadeProduto,
        ),
      );
    });

    nome.clear();
    preco.clear();
    quantidade.clear();
  }

  void removerProduto(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  void limparCampos() {
    nome.clear();
    preco.clear();
    quantidade.clear();
  }

  @override
  void dispose() {
    nome.dispose();
    preco.dispose();
    quantidade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque Simples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: preco,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: quantidade,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionarProduto,
                  child: const Text('Adicionar'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: limparCampos,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: produtos.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum produto cadastrado.',
                      ),
                    )
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        final Produto produto = produtos[index];

                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.inventory_2,
                            ),
                            title: Text(
                              produto.nome,
                            ),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)} '
                              '• Quantidade: ${produto.quantidade}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: () {
                                removerProduto(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}