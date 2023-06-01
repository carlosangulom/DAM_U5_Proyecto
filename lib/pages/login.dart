import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _userController,
                decoration: const InputDecoration(labelText: 'Usuario'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              ElevatedButton(
                child: const Text('Iniciar Sesión'),
                onPressed: () async {
                  String _user = _userController.text;
                  String _password = _passwordController.text;

                  if (_user.isEmpty || _password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Los campos de usuario y contraseña no pueden estar vacíos.')));
                  } else {
                    try {
                      var user = await loginUser(_user, _password);
                      if (user) {
                        Navigator.popAndPushNamed(context, "/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Error al iniciar sesión.')));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Error al iniciar sesión.')));
                    }
                  }
                },
              ),
              TextButton(
                child: const Text('¿No tienes una cuenta? Regístrate'),
                onPressed: () async {
                  // Mendiga basura, aquí metes la ruta o el Navigator.push para el de crear cuenta, le puse SignUp
                  Navigator.pushNamed(context, "/register");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
