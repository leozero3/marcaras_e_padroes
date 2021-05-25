import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
  
}
class HomeState extends State<Home>{

  TextEditingController _cpfController = TextEditingController();

  String _valorRecuperado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mascaras e Validações'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Digite CPF'),
            ),

            RaisedButton(
                child: Text('Recuperar Valor'),
                onPressed: (){

            },),
            Text('valor: $_valorRecuperado'),

          ],
        ),
      ),
    );
  }
  
}