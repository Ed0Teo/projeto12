import 'package:flutter/material.dart';
import 'EdicaoLista.dart'; // Importação da tela de edição

class DetalhesListaPage extends StatefulWidget {
  final Map<String, dynamic> lista;

  DetalhesListaPage({required this.lista});

  @override
  _DetalhesListaPageState createState() => _DetalhesListaPageState();
}

class _DetalhesListaPageState extends State<DetalhesListaPage> {
  late List<Map<String, dynamic>> filteredItens;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItens = List.from(widget.lista['itens']);
  }

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItens = List.from(widget.lista['itens']);
      } else {
        filteredItens = widget.lista['itens'].where((item) {
          return item['nome'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void atualizarLista(Map<String, dynamic> novaLista) {
    setState(() {
      widget.lista['nome'] = novaLista['nome'];
      widget.lista['itens'] = List.from(novaLista['itens']);
      filteredItens = List.from(novaLista['itens']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lista['nome']),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EdicaoLista(
                    lista: widget.lista,
                    editarLista: (Map<String, dynamic> novaLista) {
                      atualizarLista(novaLista);
                    },
                  ),
                ),
              );
              if (result != null && result is Map<String, dynamic>) {
                atualizarLista(result);
              }
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterItems,
              decoration: InputDecoration(
                labelText: 'Localizar Item',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: false, // Aqui está o checkbox desmarcado
                    onChanged: (bool? value) {
                      // Ação ao mudar o valor do checkbox
                    },
                  ),
                  title: Text(
                      '${filteredItens[index]['nome']} (${filteredItens[index]['quantidade']})'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
