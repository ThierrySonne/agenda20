import 'package:agenda20/screens/campanhas/campanhas_list.dart';
import 'package:agenda20/screens/login_screen.dart';
import 'package:agenda20/screens/perfil/perfil_screen.dart';
import 'package:agenda20/screens/personagens/personagens_list.dart';
import 'package:agenda20/screens/sessoes/sessoes_list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("AGEND20",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Login()
              ));

            },
            child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Icon(Icons.exit_to_app,
                color: Colors.black,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _msgSuperiorTXT(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('Olá (Nome do Usuário)!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),),
                  Text('O que você vai organizar hoje?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                _ItemButton(nome: 'SESSÕES', icone: Icons.add_circle, onClick: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SessoesList()
                  ));
                },),
                _ItemButton(nome: 'CAMPANHAS', icone: Icons.note_add, onClick: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CampanhasList()
                  ));
                }),
                _ItemButton(nome: 'PERSONAGENS', icone: Icons.accessibility_new_rounded, onClick: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PersonagensList()
                  ));
                },),
                _ItemButton(nome: 'MEU PERFIL', icone: Icons.person, onClick: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilScreen()
                  ));
                },),
              ],
            ),
          ],
        ),
      )
    );
  }

}

Widget _msgSuperiorTXT(){
  return Container(
    color: Colors.black26,
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.all(8.0),
    child: Text("Página inicial", style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    )),
  );
}

Widget _imgCentral(){
  return Padding(
    padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset('imagens/ordem.jpeg', height: 200,)),

  );
}

class _ItemButton extends StatelessWidget {
  final String nome;
  final IconData icone;
  final VoidCallback onClick;
  const _ItemButton({
    required this.nome,
    required this.icone,
    required this.onClick,
   });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Colors.purple,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          onTap: this.onClick,
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 250,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(this.icone),
                Text(this.nome, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
