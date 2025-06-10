import 'package:agenda20/database/personagem_dao.dart';
import 'package:agenda20/model/personagem.dart';
import 'package:agenda20/screens/agenda.dart';
import 'package:flutter/material.dart';

void main() {

  _geraPersonagens(){

    Personagem p1 = Personagem(1, 'Christian', 'Ocultista', 3, 'Filhos do Caos');
    Personagem p2 = Personagem(2, 'Roberta', 'Especialista', 2, 'Vale da Estranheza');

    PersonagemDAO.adicionar(p1);
    PersonagemDAO.adicionar(p2);
  }

  _geraPersonagens();
  runApp(const Agenda());
}


