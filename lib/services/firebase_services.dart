import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> loginUser(String user, String password) async {
  var result = await db
      .collection('usuarios')
      .where('user', isEqualTo: user)
      .where('password', isEqualTo: password)
      .get();

  if (result.docs.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future<void> crearUser(
    String user, String password, String nombre, String apellido) async {
  await db.collection('usuarios').add({
    'user': user,
    'password': password,
    'nombre': nombre,
    'avatar': nombre
  });
}

Future<List> getUserData(String usuario) async {
  List user = [];
  var userDataQuery = await db
      .collection('usuarios')
      .where('user', isEqualTo: usuario)
      .get();
  for (var element in userDataQuery.docs) {
    final data = element.data();
    final userData = {
      "nombre": data["nombre"],
      "avatar": data["avatar"],
      "user": data["user"]
    };
    user.add(userData);
  }
  return user;
}


Future<List> getAllComidas() async {
  List comidas = [];
  var comidasDataQuery = await db.collection("comidas").get();

  for(var element in comidasDataQuery.docs){
    final data = element.data();
    final comidasData = {
      "nombre": data["nombre"],
      "tipo": data["tipo"],
      "receta": data["receta"],
      "imagen": data["imagen"],
      "contenidocal": data["contenidocal"]
    };
    comidas.add(comidasData);
  }
  return comidas;
}

Future<List> getComidasDia() async {
  List comidas = await getAllComidas();
  List comidasDia = [];
  var desayuno = comidas.where((element) => element["tipo"].toString().contains("Desayuno")).toList();
  var comida = comidas.where((element) => element["tipo"].toString().contains("Comida")).toList();
  var cena = comidas.where((element) => element["tipo"].toString().contains("Cena")).toList();
  comidasDia.addAll({desayuno.last, comida.last, cena.last});
  return comidasDia;
}