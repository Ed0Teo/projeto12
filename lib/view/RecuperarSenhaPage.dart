import 'package:flutter/material.dart';

class RecuperarSenhaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail cadastrado',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para recuperação de senha
                Navigator.pop(context);
              },
              child: Text('Recuperar Senha'),
            ),
          ],
        ),
      ),
    );
  }
}