import 'package:flutter/material.dart';
import 'AdicionarItemPage.dart';

class EdicaoLista extends StatefulWidget {
  final Map<String, dynamic> lista;
  final Function editarLista;

  EdicaoLista({required this.lista, required this.editarLista});

  @override
  _EdicaoListaState createState() => _EdicaoListaState();
}

class _EdicaoListaState extends State<EdicaoLista> {
  TextEditingController nomeController = TextEditingController();
  List<Map<String, dynamic>> itens = [];

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.lista['nome'];
    itens = List.from(widget.lista['itens']);
  }

  void adicionarItem(String nome, int quantidade) {
    setState(() {
      itens.add({
        'nome': nome,
        'quantidade': quantidade,
      });
    });
  }

  void _editarItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String nome = itens[index]['nome'];
        int quantidade = itens[index]['quantidade'];

        return AlertDialog(
          title: Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: nome),
                onChanged: (value) {
                  nome = value;
                },
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: TextEditingController(text: quantidade.toString()),
                onChanged: (value) {
                  quantidade = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantidade'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  itens[index]['nome'] = nome;
                  itens[index]['quantidade'] = quantidade;
                });
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void removerItem(int index) {
    setState(() {
      itens.removeAt(index);
    });
  }

  void salvarEdicao() {
    widget.editarLista({
      'nome': nomeController.text,
      'itens': itens,
    });
    Navigator.popUntil(context, ModalRoute.withName('/lista_compras'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Lista de Compras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.lista['nome'],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdicionarItemPage(
                      adicionarItem: adicionarItem,
                    ),
                  ),
                );
              },
              child: Text('Adicionar Item'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${itens[index]['nome']} (${itens[index]['quantidade']})'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editarItem(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            removerItem(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: salvarEdicao,
              child: Text('Salvar Edição'),
            ),
          ],
        ),
      ),
    );
  }
}
