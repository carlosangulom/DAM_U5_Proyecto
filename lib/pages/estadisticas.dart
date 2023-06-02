import 'package:flutter/material.dart';

import 'package:dam_u5_proyecto/services/auth_service.dart';

class Estadisticas extends StatefulWidget {
  const Estadisticas({super.key});

  @override
  State<Estadisticas> createState() => _EstadisticasState();
}

class _EstadisticasState extends State<Estadisticas> {
  
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text(
            "balance",
            style: TextStyle(fontFamily: "DreamOrphans", fontSize: 42),
          ),
          foregroundColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  }),
          actions: [
                  IconButton(
                    icon: const Icon(Icons.chat_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, "/chat");
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ]
              ),
      body: const Center(
        child: Text("Text")
      ),
    );
  }
}
