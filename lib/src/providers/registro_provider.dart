import 'package:app_recarga/src/models/user_register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersProvider {
  final Uri _url =
      Uri.parse('https://apprecarga-f10df-default-rtdb.firebaseio.com/');

  Future<bool> crearUser(UserRegister registro) async {
    final url = Uri.parse('$_url/usuarios.json');
    try {
      final resp = await http.post(
        url,
        body: userRegisterToJson(registro),
      );

      final decodedData = json.decode(resp.body);
      print(decodedData);
      return true;
    } catch (e) {
      print('Error creating user: $e');
      return false;
    }
  }

  Future<bool> editarUser(UserRegister registro) async {
    final url = Uri.parse('$_url/usuarios/${registro.id}.json');
    try {
      final resp = await http.put(
        url,
        body: userRegisterToJson(registro),
      );

      final decodedData = json.decode(resp.body);
      print(decodedData);
      return true;
    } catch (e) {
      print('Error editing user: $e');
      return false;
    }
  }

  Future<List<UserRegister>> obtenerUser() async {
    final url = Uri.parse('$_url/usuarios.json');
    try {
      final resp = await http.get(url);
      final Map<String, dynamic> decodeData = json.decode(resp.body);
      final List<UserRegister> users = [];

      if (decodeData.isEmpty) return users;

      decodeData.forEach((id, user) {
        final userTemp = UserRegister.fromJson(user);
        userTemp.id = id;

        users.add(userTemp);
      });

      return users;
    } catch (e) {
      print('Error getting users: $e');
      return [];
    }
  }

  Future<bool> login(UserRegister registro) async {
    final url = Uri.parse('$_url/usuarios.json');

    try {
      final resp = await http.get(url);
      final Map<String, dynamic> decodeData = json.decode(resp.body);

      if (decodeData.isEmpty) return false;

      // Iterar a través de los usuarios y verificar las credenciales
      for (var user in decodeData.values) {
        final userTemp = UserRegister.fromJson(user);

        // Verificar si el correo electrónico y la contraseña coinciden
        if (userTemp.email.toLowerCase() == registro.email.toLowerCase() &&
            userTemp.contrasena == registro.contrasena) {
          // Credenciales válidas
          print('Bienvenido');
          return true;
        }
      }

      // No se encontraron credenciales válidas
      print('Favor Validar sus credenciales');
      return false;
    } catch (e) {
      print('Error getting users: $e');
      return false;
    }
  }

  Future<int> borrarUser(String id) async {
    final url = Uri.parse('$_url/usuarios/$id.json');
    try {
      final resp = await http.delete(url);
      print(json.decode(resp.body));
      return 1;
    } catch (e) {
      print('Error deleting user: $e');
      return 0;
    }
  }
}
