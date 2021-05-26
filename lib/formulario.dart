import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/validadores.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String _mensagem = '';

  String _nome;
  String _idade;
  String _cpf;

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (valor){
                  _nome = valor;
                },
                // key: ,
                controller: _nomeController,
                validator: (valor) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatorio')
                      .minLength(5, msg: 'Minimo de 5 caracteres')
                      .maxLength(30, msg: 'Maximo de 30 caracteres ')
                      .valido(valor);
                },
                decoration: InputDecoration(hintText: 'Digite seu nome'),
              ),
              TextFormField(
                onSaved: (valor){
                  _idade = valor;
                },
                // key: ,
                controller: _idadeController,
                keyboardType: TextInputType.number,
                validator: (valor) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatorio')
                      .valido(valor);
                },
                decoration: InputDecoration(hintText: 'Digite sua idade'),
              ),
              TextFormField(
                // key: ,
                onSaved: (valor){
                  _cpf = valor;
                },
                controller: _cpfController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                validator: (valor) {
                  return Validador()
                      .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatorio')
                      .add(Validar.CPF, msg: 'CPF Invalido')
                      .valido(valor);
                },
                decoration: InputDecoration(hintText: 'Digite seu CPF'),
              ),
              RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {

                    ///metodo on save
                    _formKey.currentState.save();
                    setState(() {
                      setState(() {
                        _mensagem = 'Nome: ${_nome} idade: ${_idade} CPF: ${_cpf}';
                      });
                    });
                    ///
                    /// metodo controller
                    // setState(() {
                    //   _nome = _nomeController.text;
                    //   _idade = _idadeController.text;
                    //   _cpf = _cpfController.text;
                    //
                    //   _mensagem = 'Nome: ${_nome} idade: ${_idade} CPF: ${_cpf}';
                    // });
                    ///
                  }
                },
              ),
              Text(
                _mensagem,
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
