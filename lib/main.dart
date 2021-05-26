import 'package:flutter/material.dart';
import 'package:marcaras_e_padroes/formulario.dart';
import 'package:marcaras_e_padroes/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Formulario(),
      // home: Home(),
    );
  }
}
