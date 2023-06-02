import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../services/auth_service.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            RandomAvatar("${authService.user["avatar"]}", height: 100, width: 100),
            const SizedBox(
              height: 20,
            ),
            Text("${authService.user["nombre"]}",
                style: TextStyle(
                    fontFamily: "DreamOrphans",
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.secondary)),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_people_rounded),
                Text(" Estatura: 170cm"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.scale_rounded),
                Text(" Peso: 170cm"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.calendar_month_rounded),
                Text(" Edad: 22")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Tu proxima cita es el: 01/06/2023",
                style: TextStyle(
                    fontFamily: "Aubrey",
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.secondary)),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
                onPressed: () {Navigator.pushNamed(context, "/login", arguments: {"nombre": "Alan Barocio Contreras"});},
                child: const Text("Cerrar Sesión"))
          ],
        ),
      ),
    );
  }
}
