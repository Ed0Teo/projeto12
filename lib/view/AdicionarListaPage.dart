import 'package:flutter/material.dart';
import 'AdicionarItemPage.dart';

class AdicionarListaPage extends StatefulWidget {
  final Function adicionarLista;

  AdicionarListaPage({required this.adicionarLista});

  @override
  _AdicionarListaPageState createState() => _AdicionarListaPageState();
}

class _AdicionarListaPageState extends State<AdicionarListaPage> {
  TextEditingController nomeController = TextEditingController();
  List<Map<String, dynamic>> itens = [];

  void adicionarItem(String nome, int quantidade) {
    setState(() {
      itens.add({
        'nome': nome,
        'quantidade': quantidade,
      });
    });
  }

  void finalizarLista() {
    widget.adicionarLista({
      'nome': nomeController.text,
      'itens': itens,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Lista de Compras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome da Lista',
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
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: finalizarLista,
              child: Text('Finalizar'),
            ),
          ],
        ),
      ),
    );
  }
}
