import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:random_avatar/random_avatar.dart';


class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  @override
  Widget build(BuildContext context) {
    final Map arguments = (ModalRoute.of(context)!.settings.arguments ??{}) as Map;

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
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  RandomAvatar("barocio", height: 100, width: 100),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit), alignment: Alignment.bottomRight,)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.custom,
                      confirmBtnText: "Aceptar",
                      widget: TextFormField(
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "${arguments["user"]["nombre"]}",
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      onConfirmBtnTap: () {},
                      showCancelBtn: true,
                      confirmBtnColor:  const Color(0xff6b9080),
                      backgroundColor: Theme.of(context).colorScheme.background,
                      cancelBtnText: "cancelar");
                },
                child: Row(
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
                    Icon(Icons.edit,
                        color: Theme.of(context).colorScheme.secondary)
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
