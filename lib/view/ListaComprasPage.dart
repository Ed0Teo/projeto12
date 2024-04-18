import 'package:flutter/material.dart';
import 'DetalhesListaPage.dart'; // Importando DetalhesListaPage
import 'AdicionarListaPage.dart'; // Importando AdicionarListaPage

class ListaComprasPage extends StatefulWidget {
  @override
  _ListaComprasPageState createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {
  List<Map<String, dynamic>> listasDeCompras = [];

  void adicionarListaDeCompras(Map<String, dynamic> lista) {
    setState(() {
      listasDeCompras.add(lista);
    });
  }

  void editarNomeLista(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String nome = listasDeCompras[index]['nome'];

        return AlertDialog(
          title: Text('Editar Nome da Lista'),
          content: TextField(
            controller: TextEditingController(text: nome),
            onChanged: (value) {
              nome = value;
            },
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  listasDeCompras[index]['nome'] = nome;
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

  void removerLista(int index) {
    setState(() {
      listasDeCompras.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Listas de Compras'),
      ),
      body: ListView.builder(
        itemCount: listasDeCompras.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listasDeCompras[index]['nome']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesListaPage(
                    lista: listasDeCompras[index],
                  ),
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    editarNomeLista(index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removerLista(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdicionarListaPage(
                adicionarLista: adicionarListaDeCompras,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
