import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cnpjController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _moedaController = TextEditingController();

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
            Cpf(),
            Cnpj(),
            Cep(),
            Data(),
            Moeda(),


            RaisedButton(
              child: Text('Recuperar Valor'),
              onPressed: () {

                setState(() {

                  _valorRecuperado = _cpfController.text.toString();
                  _valorRecuperado = _cnpjController.text.toString();
                  _valorRecuperado = _cepController.text.toString();
                  _valorRecuperado = _telefoneController.text.toString();
                  _valorRecuperado = _dataController.text.toString();
                  _valorRecuperado = _moedaController.text.toString();


                  ///converter moeda e salvar no BD
                  String moedaBD = _moedaController.text.toString();
                  moedaBD = moedaBD.replaceAll('.', '');
                  moedaBD = moedaBD.replaceAll(',', '.');

                  double valorDouble = double.parse( moedaBD );
                  var formatador = NumberFormat('#,##0.00', 'pt_BR');
                  var resultado = formatador.format( valorDouble );

                  _valorRecuperado = 'BD: ${moedaBD} / Exibição: ${resultado}';
                  ///



                  for(var item in Estados.listaEstados){
                    print('item: $item');
                  }
                  for(var item in Meses.listaMeses){
                    print('item: $item');
                  }
                  for(var item in Semana.listaDiasSemana){
                    print('item: $item');
                  }

                });

              },
            ),
            Text(
              'valor: $_valorRecuperado',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }

  TextField Cpf() {
    return TextField(
            controller: _cpfController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            decoration: InputDecoration(hintText: 'Digite CPF'),
          );
  }

  TextField Cnpj() {
    return TextField(
      controller: _cnpjController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CnpjInputFormatter(),
      ],
      decoration: InputDecoration(hintText: 'Digite CNPJ'),
    );
  }

  TextField Cep() {
    return TextField(
      controller: _cepController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CepInputFormatter(),
      ],
      decoration: InputDecoration(hintText: 'Digite um Cep'),
    );
  }

  TextField Telefone() {
    return TextField(
      controller: _telefoneController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      decoration: InputDecoration(hintText: 'Digite um Numero'),
    );
  }

  TextField Data() {
    return TextField(
      controller: _dataController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DataInputFormatter(),
      ],
      decoration: InputDecoration(hintText: 'Digite a Data'),
    );
  }

  TextField Moeda() {
    return TextField(
      controller: _moedaController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        RealInputFormatter(centavos: true),
      ],
      decoration: InputDecoration(hintText: 'Digite um Valor'),
    );
  }
}
