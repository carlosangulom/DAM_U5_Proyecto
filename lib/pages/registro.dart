import 'package:dam_u5_proyecto/services/firebase_services.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Registro', style: TextStyle(fontSize: 30)),
              SizedBox(height: 20.0),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _userController,
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Registrarse'),
                onPressed: () async {
                  final String nombre = _nombreController.text;
                  final String apellido = _apellidoController.text;
                  final String user = _userController.text;
                  final String password = _passwordController.text;

                  try {
                    await crearUser(user, password, nombre, apellido);
                    Navigator.popAndPushNamed(context, "/login");

                    //Basura, aquí mandas a llamar la pendejada de Login otra vez, me imagino que con el navigator.pop
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpia los controladores cuando el Widget se descarte.
    _nombreController.dispose();
    _apellidoController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
