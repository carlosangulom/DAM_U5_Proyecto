import 'package:flutter/material.dart';
import 'home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import './pages/login.dart';
import './pages/registro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff6b9080),
            background: const Color(0xfffffcf2)),
        useMaterial3: true,
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const Home(),
        "/login": (context) => const Login(),
        "/register": (context) => const SignUp()
      },
    );
  }
}
