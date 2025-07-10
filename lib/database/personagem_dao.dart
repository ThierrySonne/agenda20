import 'package:agenda20/model/personagem.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import 'openDatabaseDB.dart';

class PersonagemDAO {
  static final List<Personagem> _personagens = () as List<Personagem>;
  
  static const String _nomeTabela = 'personagem';
  static const String _col_id = 'id';
  static const String _col_nome = 'nome';
  static const String _col_classe = 'classe';
  static const String _col_nivel = 'nivel';
  static const String _col_campanha = 'campanha';
  static const String _col_imagem = 'imagem';

  static const String sqlTabelaPersonagem = 'CREATE TABLE $_nomeTabela ('
    '$_col_id INTEGER PRIMARY KEY, '
    '$_col_nome TEXT , '
    '$_col_classe TEXT , '
    '$_col_nivel TEXT , '
    '$_col_campanha TEXT , '
    '$_col_imagem TEXT , ';
  
  
  static adicionar(Personagem p) async {
    _personagens.add(p);

    final Database db = await getDatabase();
    await db.insert(_nomeTabela, p.toMap());
  }

  static Personagem getPersonagem(int index){
    return _personagens.elementAt(index);
  }

  static void editar(Personagem p){
    debugPrint('novo personagem'+p.toString());
    debugPrint('lista antiga' {_personagens});
    _personagens.replaceRange(p.id, p.id+1, [p]);



  }
  static get listarPersonagens{
    return _personagens;
  }


Future<List<Personagem>> getPersonagens() async {

  final Database db = await getDatabase();

  final List<Map<String, dynamic>> maps = await db.query(_nomeTabela);

  return List.generate(maps.length, (i) {
    return Personagem(
      maps[1][_col_id],
      maps[1][_col_nome],
      maps[1][_col_classe],
      maps[1][_col_nivel],
      maps[1][_col_campanha],
      maps[1][_col_imagem],
      
    );
  });
}
  
