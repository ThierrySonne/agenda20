import 'package:agenda20/screens/dashboard.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  labelText: "E-mail:",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "fulano@gmail.com"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  labelText: "Senha:",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "*********"
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey,
              padding: EdgeInsets.symmetric(vertical: 25.0),
              width: double.infinity,
              child: ElevatedButton(
                style: flatButtonStyle,
                  onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Dashboard()));
                  },
              child: Text("LOGIN", style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),))
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Esqueci minha senha',style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),),
              Text('Não possuo uma conta',style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),),
            ],
          ),
        ],
      )
    );
  }
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
