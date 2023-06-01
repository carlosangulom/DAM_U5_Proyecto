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
              const Text('Iniciar Sesión', style: TextStyle(fontSize: 30, fontFamily: "Caviar",)),
              const SizedBox(height: 20.0),
              TextField(
                controller: _userController,
                decoration: const InputDecoration(labelText: 'Usuario'),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
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
              ),
              const SizedBox(height: 20.0),
              TextButton(
                child: const Text('¿No tienes una cuenta? Regístrate'),
                onPressed: () async {
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
