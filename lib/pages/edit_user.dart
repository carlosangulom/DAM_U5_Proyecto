import 'package:dam_u5_proyecto/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:random_avatar/random_avatar.dart';

import '../services/auth_service.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  AuthService authService = AuthService();

  final nombreController = TextEditingController();
  final avatarController = TextEditingController();  

  String avatar = " ";
  String nombre = " ";

  @override
  void initState() {
    super.initState();
    avatar = "${authService.user["avatar"]}";
    nombre = "${authService.user["nombre"]}";
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments =
        (ModalRoute.of(context)!.settings.arguments ?? {}) as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          "Editar Perfil",
          style: TextStyle(fontFamily: "DreamOrphans", fontSize: 42),
        ),
        foregroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.popAndPushNamed(context, "/perfil"),
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Stack(
                children: [
                  RandomAvatar(avatar, height: 100, width: 100),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff6b9080)),
                        child: IconButton(
                          onPressed: () {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.custom,
                              confirmBtnText: "Aceptar",
                              customAsset: "assets/dialogs/avatar.gif",
                              widget: TextFormField(
                                controller: avatarController,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  hintText: "${arguments["user"]["avatar"]}",
                                  prefixIcon: const Icon(
                                    Icons.account_circle,
                                  ),
                                ),
                              ),
                              onConfirmBtnTap: () {
                                setState(() {
                                  avatar = avatarController.text;
                                });
                                Navigator.pop(context);
                              },
                              showCancelBtn: true,
                              confirmBtnColor: const Color(0xff6b9080),
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              cancelBtnText: "Cancelar");
                          },
                          icon: const Icon(Icons.edit),
                          alignment: Alignment.bottomRight,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${arguments["user"]["nombre"]}",
                        style: TextStyle(
                            fontFamily: "DreamOrphans",
                            fontSize: 32,
                            color: Theme.of(context).colorScheme.secondary)),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff6b9080)),
                      child: IconButton(
                        onPressed: () {
                          QuickAlert.show(
                              context: context,
                              type: QuickAlertType.custom,
                              confirmBtnText: "Aceptar",
                              customAsset: "assets/dialogs/edit.gif",
                              widget: TextFormField(
                                controller: nombreController,
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  hintText: "${arguments["user"]["nombre"]}",
                                  prefixIcon: const Icon(
                                    Icons.person,
                                  ),
                                ),
                              ),
                              onConfirmBtnTap: () {
                                setState(() {
                                  nombre = nombreController.text;
                                });
                                Navigator.pop(context);
                              },
                              showCancelBtn: true,
                              confirmBtnColor: const Color(0xff6b9080),
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              cancelBtnText: "Cancelar");
                        },
                        icon: const Icon(Icons.edit),
                        alignment: Alignment.bottomRight,
                        color: Colors.white,
                      ),
                    )
                  ],
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(onPressed: (){}, child: const Text("Cambiar contraseña")),
              const Spacer(flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.popAndPushNamed(context, "/perfil");
                  }, child: const Text("Cancelar")),
                  const SizedBox(width: 30,),
                  ElevatedButton(onPressed: (){
                    updateUser(nombre, avatar, arguments["user"]["uid"]);
                    Navigator.popAndPushNamed(context, "/perfil");
                  }, child: const Text("Aceptar"))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}