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
      home: CadastroTarefas(),
    );
  }
}

class CadastroTarefas extends StatefulWidget {
  const CadastroTarefas({super.key});

  @override
  State<CadastroTarefas> createState() => _CadastroTarefasState();
}

class _CadastroTarefasState extends State<CadastroTarefas> {
  final TextEditingController tarefa = TextEditingController();

  final List<String> tarefas = [];

  void adicionarTarefa() {
    final String novaTarefa = tarefa.text.trim();

    if (novaTarefa.isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(novaTarefa);
    });

    tarefa.clear();
  }

  void removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  void limparCampo() {
    tarefa.clear();
  }

  @override
  void dispose() {
    tarefa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tarefa,
              decoration: const InputDecoration(
                labelText: 'Digite uma tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionarTarefa,
                  child: const Text('Adicionar'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: limparCampo,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: tarefas.isEmpty
                  ? const Center(
                      child: Text('Nenhuma tarefa cadastrada.'),
                    )
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.check,
                            ),
                            title: Text(tarefas[index]),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: () {
                                removerTarefa(index);
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