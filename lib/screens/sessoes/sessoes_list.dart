import 'package:flutter/material.dart';

import '../login_screen.dart';

class SessoesList extends StatelessWidget {
  const SessoesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("SESSÕES",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('Agendamento de Sessões com base nas campanhas e personagens disponíveis', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}
