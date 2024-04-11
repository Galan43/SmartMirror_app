import 'package:firebase_auth/firebase_auth.dart';

class RegistroData {
  final String nombre, apellido, email, password; // Se cambiaron "late final" a "final"

  RegistroData({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.password,
  });
}

class RegistroResponse {
  final String? error;
  final User? user;

  RegistroResponse(this.error, this.user); // Se corrigió el constructor

  // También puedes considerar añadir un constructor nombrado para manejar el caso de éxito sin errores
  RegistroResponse.success(User this.user)
      : error = null;

  // Y otro constructor nombrado para manejar el caso de error sin usuario
  RegistroResponse.error(String this.error)
      : user = null;
}
