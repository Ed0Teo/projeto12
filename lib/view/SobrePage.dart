import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Lista de Compras App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Desenvolvido por: Edson Téo Araújo'),
            Text('Tema: Lista de Compras'),
            Text('Objetivo: Auxiliar na criação e gerenciamento de listas'),
            Text('de listas de compras.'),
          ],
        ),
      ),
    );
  }
}
