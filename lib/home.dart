import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import './pages/inicio.dart';
import './pages/plan.dart';
import './pages/perfil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  static const List<Widget> _pages = <Widget>[Inicio(), Plan(), Perfil()];

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
                icon: RandomAvatar("barocio", width: 35, height: 35),
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                })
            : IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () {
                  setState(() {
                    // _currentIndex = 0;
                    Navigator.pushNamed(context, "/login");
                  });
                }),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_rounded),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
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
