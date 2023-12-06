import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_moviles2/models/equipamento.dart';

class EquipProvider extends ChangeNotifier {
  String _baseUrl = 'https://valorant-api.com/v1/gear';
  String _language = 'es-MX';

  List<Equip> equipo = [];

  EquipProvider() {
    getEquips();
  }

  Future<void> getEquips() async {
    final url = Uri.parse('$_baseUrl?language=$_language');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      equipo = (decodedData['data'] as List).map((item) => Equip.fromJson(item)).toList();
      notifyListeners();
    } else {
      print('Error al obtener el equipo. Código de respuesta: ${response.statusCode}');
    }
  }
}