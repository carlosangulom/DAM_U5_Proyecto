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

Future<void> crearUser(String user, String password, String nombre, String apellido) async {
  await db.collection('usuarios').add({
    'user': user,
    'password': password,
    'nombre': nombre,
    'apellido': apellido,
  });
}
