import 'dart:convert';

CardRegister cardRegisterFromJson(String str) =>
    CardRegister.fromJson(json.decode(str));

String cardRegisterToJson(CardRegister data) => json.encode(data.toJson());

class CardRegister {
  String id;
  String entidadBancaria;
  String titularTarjeta;
  int numeroTarjeta;
  String fechaVencimiento;
  int cvv;
  String user;

  CardRegister({
    this.id = "",
    this.entidadBancaria = "",
    this.titularTarjeta = "",
    this.numeroTarjeta = 0,
    this.fechaVencimiento = "",
    this.cvv = 0,
    this.user = "",
  });

  factory CardRegister.fromJson(Map<String, dynamic> json) => CardRegister(
        id: json["id"],
        entidadBancaria: json["entidadBancaria"],
        titularTarjeta: json["titularTarjeta"],
        numeroTarjeta: json["numeroTarjeta"],
        fechaVencimiento: json["fechaVencimiento"],
        cvv: json["cvv"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entidadBancaria": entidadBancaria,
        "titularTarjeta": titularTarjeta,
        "numeroTarjeta": numeroTarjeta,
        "fechaVencimiento": fechaVencimiento,
        "cvv": cvv,
        "user": user,
      };
}
