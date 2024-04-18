import 'package:flutter/material.dart';

class AdicionarItemPage extends StatefulWidget {
  final Function adicionarItem;

  AdicionarItemPage({required this.adicionarItem});

  @override
  _AdicionarItemPageState createState() => _AdicionarItemPageState();
}

class _AdicionarItemPageState extends State<AdicionarItemPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Item',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.adicionarItem(
                  nomeController.text,
                  int.parse(quantidadeController.text).toInt(),
                );
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
