import 'dart:io';

import 'package:agenda20/database/personagem_dao.dart';
import 'package:agenda20/screens/personagens/personagens_add.dart';
import 'package:flutter/material.dart';

import '../../model/personagem.dart';

class PersonagensList extends StatefulWidget {


  late int _index;
  int get index => _index;

  set index(int value) {
    _index = value;
  }
  PersonagemScreen({int? index}){
    this.index = index!;

    if(this.index == null){
      this.index = -1;
    }
  }


  @override
  State<PersonagensList> createState() => _PersonagensListState();
}

class _PersonagensListState extends State<PersonagensList> {



  @override
  Widget build(BuildContext context) {

    List<Personagem> personagens = PersonagemDAO.listarPersonagens;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('PERSONAGENS',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.black26,
            child: TextField(
              style: TextStyle(fontSize: 25),
             decoration: InputDecoration(
               labelText: "Pesquisar",
               hintText: "Pesquisar",
               prefixIcon: Icon(Icons.search),
             ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: ListView.builder(
                  itemCount: personagens.length,
                  itemBuilder: (context, index) {
                    final Personagem p = personagens[index];
                    return _ItemLista(p, onClick: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> PersonagemScreen( index))
                      ).then((value) {
                        setState(() {
                          debugPrint('Voltou');
                        });
                      });
                    },);
                  }
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: (){

          Navigator.of(context).push(MaterialPageRoute(

            builder: (context) => PersonagemScreen()
          )).then((value) {

            setState(() {
              debugPrint('adicionar personagens');
            });
          });


        },
        child: Icon(Icons.add,
        color: Colors.black,),
      ),
    );
  }
}

class _ItemLista extends StatelessWidget {

  final Personagem _personagem;
  final Function onClick;

  _ItemLista(this._personagem, {required this.onClick});

  Widget _avatarImagemPersona(){

    var inicial = this._personagem.nome[0].toUpperCase();
    if(this._personagem.imagem.length> 0){
      inicial = '';
    }

    return CircleAvatar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.purple,
      backgroundImage: FileImage(File(this._personagem.imagem)),
      radius: 22.0,
      child: Text (inicial,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => this.onClick();
          leading: _avatarImagemPersona(),
          title: Text(this._personagem.nome, style: TextStyle(fontSize: 24),),
          trailing: _menu(),
        ),
        Divider(
          color: Colors.black,
          thickness: 2.0,
          height: 0.0,
        ),
      ],
    );
  }

  Widget _menu(){
    return PopupMenuButton(
        color: Colors.grey,
        onSelected: (ItensMenuListPersonagem selecionado){
          debugPrint("Selecionado... $selecionado");
        },
        itemBuilder: (BuildContext context) => <PopupMenuItem<ItensMenuListPersonagem>>[

          const PopupMenuItem(
            value: ItensMenuListPersonagem.apagar,
            child: Text('Apagar'),
          ),
      ],
    );
  }
}

  enum ItensMenuListPersonagem { apagar,}
