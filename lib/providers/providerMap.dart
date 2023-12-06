import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_moviles2/models/mapa.dart';

class MapaProvider extends ChangeNotifier {
  String _baseUrl = 'https://valorant-api.com/v1/maps';
  String _language = 'es-MX';

  List<MapaV> mapas = [];

  MapaProvider() {
    getMapas();
  }

  Future<void> getMapas() async {
    final url = Uri.parse('$_baseUrl?language=$_language');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      mapas = (decodedData['data'] as List).map((item) => MapaV.fromJson(item)).toList();
      notifyListeners(); 
    } else {
      print('Error al obtener los mapas. Código de respuesta: ${response.statusCode}');
    }
  }
}
