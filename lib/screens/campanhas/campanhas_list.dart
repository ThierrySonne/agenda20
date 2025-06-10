import 'package:flutter/material.dart';

import '../login_screen.dart';

class CampanhasList extends StatelessWidget {
  const CampanhasList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("CAMPANHAS", style: TextStyle(fontWeight: FontWeight.bold),),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('Criação, Listagem e edição de campanhas com possibilidade de criar longas anotações e anexar perfis de personagens', style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold,),),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
