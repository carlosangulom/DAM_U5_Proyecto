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
            const SizedBox(height: 100,),
            RandomAvatar("alan", height: 100, width: 100)
          ],
        ),
      ),
    );
  }
}