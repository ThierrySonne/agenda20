import 'package:agenda20/database/personagem_dao.dart';
import 'package:agenda20/model/personagem.dart';
import 'package:agenda20/service/image_picker_widget.dark.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PersonagemScreen extends StatefulWidget {

  @override
  State<PersonagemScreen> createState() => _PersonagemScreenState();
}

class _PersonagemScreenState extends State<PersonagemScreen> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              _imagem(context),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
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
                validator: (value) {
                  if (value!.isEmpty) {
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nível Obrigatório';
                  }
                  return null;
                },
                controller: this._nivelController,
                decoration: InputDecoration(
                    labelText: "Nível:"
                ),
                style: TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
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
                    style: flatButtonStyle,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Personagem p =
                        new Personagem(0,
                          this._nomeController.text,
                          this._classeController.text,
                          this._nivelController.text,
                          this._campanhaController.text,
                          this._imagemPersona
                        );
                        PersonagemDAO.adicionar(p);
                        Navigator.of(context).pop();
                      } else {
                        debugPrint('formulário inválido');
                      }
                    },
                    child: Text(
                      'SALVAR', style: TextStyle(color: Colors.black),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    elevation: 5,
    backgroundColor: Colors.purpleAccent,
    foregroundColor: Colors.black87,
    padding: EdgeInsets.symmetric(vertical: 20.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  );

  Widget _imagem(BuildContext context) {
    return InkWell(
      onTap: () {
        alertTirarFoto(context);
      },
      child: CircleAvatar(
        backgroundImage: AssetImage('imagens/camera.png'),
        radius: 70,
        child: ClipOval(
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.file(File(this._imagemPersona))
            )
        ),
      ),
    );
  }

  alertTirarFoto(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        'Adicionar Imagem?', style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text('Tire uma foto ou escolha da sua galeria:'),
      elevation: 5.0,
      actions: [
        ElevatedButton(
          child: Text('Câmera'),
          onPressed: () {
            debugPrint('usuário câmera');
            _receberImagem(ImageSource.camera);
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Galeria'),
          onPressed: () {
            debugPrint('usuário galeria');
            _receberImagem(ImageSource.gallery);
            Navigator.of(context).pop();
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        }
    );
  }

  String _imagemPersona ='';

  _receberImagem(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      debugPrint('image -> ${image.path}');

      setState(() {
        this._imagemPersona = image.path;
      });

    }
  }
}
