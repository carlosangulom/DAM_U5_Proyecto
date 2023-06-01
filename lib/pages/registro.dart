import 'package:dam_u5_proyecto/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.popAndPushNamed(context, "/login"),
          iconSize: 32,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Registro', style: TextStyle(fontSize: 30, fontFamily: "Caviar",)),
              const SizedBox(height: 20.0),
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre', ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _userController,
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Registrarse'),
                onPressed: () {
                  final String nombre = _nombreController.text;
                  final String apellido = _apellidoController.text;
                  final String user = _userController.text;
                  final String password = _passwordController.text;

                  String? errorMsg;

                  if (nombre.isEmpty && apellido.isEmpty && user.isEmpty && password.isEmpty) {
                    errorMsg = 'Todos los campos están vacíos.';
                  } else {
                    if (nombre.isEmpty) {
                      errorMsg = 'El campo nombre no puede estar vacío.';
                    } else if (apellido.isEmpty) {
                      errorMsg = 'El campo apellido no puede estar vacío.';
                    } else if (user.isEmpty) {
                      errorMsg = 'El campo usuario no puede estar vacío.';
                    } else if (password.isEmpty) {
                      errorMsg = 'El campo contraseña no puede estar vacío.';
                    }
                  }

                  if (errorMsg != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(errorMsg),
                    ));
                  } else {
                    crearUser(user, password, nombre, apellido).then((_) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: '¡Usuario registrado correctamente!',
                        confirmBtnText: 'Aceptar',
                        onConfirmBtnTap: () {
                          Navigator.popAndPushNamed(context, "/login");
                        },
                      );
                    }).catchError((e) {
                      print(e.toString());
                    });
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
    _nombreController.dispose();
    _apellidoController.dispose();
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
