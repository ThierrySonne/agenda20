import 'package:agenda20/database/personagem_dao.dart';
import 'package:agenda20/model/personagem.dart';
import 'package:flutter/material.dart';

class PersonagemScreen extends StatelessWidget {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _classeController = TextEditingController();
  final TextEditingController _nivelController = TextEditingController();
  final TextEditingController _campanhaController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('NOVO PERSONAGEM'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value){
                if(value == null){
                  return 'Nome Obrigatório';
                }
                return null;
              },
              controller: this._nomeController,
              decoration: InputDecoration(
                labelText: "Nome:"
              ),
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              validator: (value){
                if(value == null){
                  return 'Classe Obrigatória';
                }
                return null;
              },
              controller: this._classeController,
              decoration: InputDecoration(
                  labelText: "Classe:"
              ),
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              validator: (value){
                if(value == null){
                  return 'Nível Obrigatório';
                }
                return null;
              },
              controller: this._nivelController,
              decoration: InputDecoration(
                  labelText: "Nível:"
              ),
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              validator: (value){
                if(value == null){
                  return 'Campanhas Obrigatória';
                }
                return null;
              },
              controller: this._campanhaController,
              decoration: InputDecoration(
                  labelText: "Campanha:"
              ),
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                height: 80,
                child: ElevatedButton(
                  onPressed: (){
                    if(_formkey.currentState!.validate()) {

                      Personagem p = 
                          new Personagem(0,
                              this._nomeController.text,
                              this._classeController.text,
                              this._nivelController.text as int,
                              this._campanhaController.text);

                      PersonagemDAO.adicionar(p);
                      Navigator.of(context).pop();

                    }else{
                      debugPrint('formulário inválido');
                    }
                  },
                  child: Text('SALVAR',style: TextStyle(color:Colors.black),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
