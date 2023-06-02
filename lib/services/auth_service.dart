class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  AuthService._internal() {
    _user = {
      "nombre": user["nombre"],
      "apellido": user["apellido"],
      "usuario":user["user"]
    };
    _comidasDia = comidasDia;
  }

  Map _user = {
    "nombre": "",
      "apellido": "",
      "usuario":""
  };

  List _comidasDia = [];

  Map get user => _user;
  set user(Map value) => user.addAll(value);

  List get comidasDia => _comidasDia;
  set comidasDia(List value) => comidasDia.addAll(value);
}
