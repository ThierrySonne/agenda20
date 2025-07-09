import 'package:agenda20/model/personagem.dart';
import 'package:flutter/cupertino.dart';

class PersonagemDAO {
  static final List<Personagem> _personagens = [];

  static adicionar(Personagem p){
    _personagens.add(p);
  }

  static Personagem getPersonagem(int index){
    return _personagens.elementAt(index);
  }

  static void editar(Personagem p){
    debugPrint('novo personagem'+p.toString());
    debugPrint('lista antiga' ${_personagens});;
    );


  }
  static get listarPersonagens{
    return _personagens;
  }

}

}