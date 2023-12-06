// To parse this JSON data, do
//
//     final userRegister = userRegisterFromJson(jsonString);

import 'dart:convert';

UserRegister userRegisterFromJson(String str) =>
    UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
  String id;
  String nombreUsuario;
  String email;
  String contrasena;
  bool terminoCondicion = false;

  UserRegister({
    this.id = "",
    this.nombreUsuario = "",
    this.email = "",
    this.contrasena = "",
    this.terminoCondicion = false,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
        id: json["id"],
        nombreUsuario: json["nombreUsuario"],
        email: json["email"],
        contrasena: json["contrasena"],
        terminoCondicion: json["terminoCondicion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombreUsuario": nombreUsuario,
        "email": email,
        "contrasena": contrasena,
        "terminoCondicion": terminoCondicion,
      };
}
