/*import 'dart:convert';

RegistroModel registroModelFromJson(String str) => RegistroModel.fromJson(json.decode(str));

String registroModelToJson(RegistroModel data) => json.encode(data.toJson());

class RegistroModel {
  String id;
  String nombre;
  String usuario;
  String mail;
  String password;

  RegistroModel({
    this.id,
    this.nombre,
    this.usuario,
    this.mail,
    this.password,
  });

  factory RegistroModel.fromJson(Map<String, dynamic> json) => RegistroModel(
      id: json["id"],
      nombre: json["nombre"],
      usuario: json["usuario"],
      mail: json["mail"],
      password: json["password"],)

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "usuario": usuario,
        "mail": mail,
        "password": password
      };

}
*/