import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            RandomAvatar("barocio", height: 100, width: 100),
            const SizedBox(
              height: 20,
            ),
            Text("Alan Barocio Contreras",
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
                Text("Estatura: 170cm"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.scale_rounded),
                Text("Peso: 170cm"),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.calendar_month_rounded),
                Text("Edad: 22")
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, "/login"),
                child: const Text("Cerrar Sesión"))
          ],
        ),
      ),
    );
  }
}
