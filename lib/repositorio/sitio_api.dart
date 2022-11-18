import 'dart:convert';
import 'package:ejemplo_2/modelos/regiones.dart';
import 'package:http/http.dart' as http;

class SitiosApi {
  Future<Regiones> getSitio(String parametro) async {
    final response = await http.get(
        Uri.parse('https://josue-y.github.io/sitios.github.io/'));

    if (response.statusCode == 200) {
      return Regiones.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}