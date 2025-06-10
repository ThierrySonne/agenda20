import 'package:agenda20/model/personagem.dart';

class PersonagemDAO {
  static final List<Personagem> _personagens = [];

  static adicionar(Personagem p){
    _personagens.add(p);
  }

  static get listarPersonagens{
    return _personagens;
  }

}