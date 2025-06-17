import 'package:agenda20/service/image_picker_widget.dark.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("MEU PERFIL",style: TextStyle(fontWeight: FontWeight.bold),),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text('Edição de perfil, informações pessoais, foto e dados', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
                    ImagePickerWidget(),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }

}
