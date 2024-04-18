import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:projeto12/view/LoginPage.dart';
import 'package:projeto12/view/CadastroPage.dart';
import 'package:projeto12/view/RecuperarSenhaPage.dart';
import 'package:projeto12/view/SobrePage.dart';
import 'package:projeto12/view/ListaComprasPage.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/cadastro': (context) => CadastroPage(),
        '/recuperar_senha': (context) => RecuperarSenhaPage(),
        '/sobre': (context) => SobrePage(),
        '/lista_compras': (context) => ListaComprasPage(),
      },
    );
  }
}