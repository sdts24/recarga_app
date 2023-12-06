import 'package:app_recarga/src/models/card_register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TarjetasProvider {
  final Uri _url =
      Uri.parse('https://apprecarga-f10df-default-rtdb.firebaseio.com/');

  Future<bool> crearTarjetas(CardRegister tarjeta) async {
    final url = Uri.parse('$_url/tarjetas.json');
    try {
      final resp = await http.post(
        url,
        body: cardRegisterToJson(tarjeta),
      );

      final decodedData = json.decode(resp.body);
      print(decodedData);
      return true;
    } catch (e) {
      print('Error creating card: $e');
      return false;
    }
  }
}
