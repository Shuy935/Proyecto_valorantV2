import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_moviles2/models/armas.dart';

class ArmasProvider extends ChangeNotifier {
  String _baseUrl = 'https://valorant-api.com/v1/weapons';
  String _language = 'es-MX';

  List<Armas> armas = [];

  ArmasProvider() {
    getArmas();
  }

  Future<void> getArmas() async {
    final url = Uri.parse('$_baseUrl?language=$_language');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      armas = (decodedData['data'] as List).map((item) => Armas.fromJson(item)).toList();
      notifyListeners();
    } else {
      print('Error al obtener las armas. Código de respuesta: ${response.statusCode}');
    }
  }
}
