import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import './pages/inicio.dart';
import './pages/plan.dart';
import './pages/perfil.dart';

import './services/firebase_services.dart';

import 'package:dam_u5_proyecto/services/auth_service.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.index});
  final int index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  
  static const List<Widget> _pages = <Widget>[Inicio(), Plan(), Perfil()];
  AuthService authService = AuthService();

  Map user = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _currentIndex = widget.index;
    });

    Future.delayed(Duration.zero, () {
      getUserData("carlos").then((data) => setState(
            () {
              user = {
                "uid": data.first["uid"],
                "nombre": data.first["nombre"],
                "usuario": data.first["user"],
                "avatar": data.first["avatar"]
              };
              authService.user.addAll(user);
            },
          ));
      getComidasDia().then((data) => setState(() {
        authService.comidasDia.addAll(data);
      },));
    });
  }

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
          leading: _currentIndex != 2
              ? IconButton(
                  icon: RandomAvatar("${user["avatar"]}", width: 35, height: 35),
                  onPressed: () {
                    Navigator.pushNamed(context, "/perfil");
                  })
              : IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  }),
          actions: _currentIndex != 2
              ? [
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
              : [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => Navigator.popAndPushNamed(context, "/edit",
                        arguments: {"user": authService.user}),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ]),
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => {
          setState(() => _currentIndex = i),
        },
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: const Color(0xff588157),
        backgroundColor: Theme.of(context).colorScheme.background,
        itemPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text("Inicio",
                  style:
                      TextStyle(fontFamily: "DreamOrphans", letterSpacing: 1))),
          SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_today_rounded),
              title: const Text("Plan",
                  style:
                      TextStyle(fontFamily: "DreamOrphans", letterSpacing: 1))),
          SalomonBottomBarItem(
              icon: const Icon(Icons.person_rounded),
              title: const Text("Perfil",
                  style:
                      TextStyle(fontFamily: "DreamOrphans", letterSpacing: 1)))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
