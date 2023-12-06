import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_moviles2/models/agente.dart';

class AgenteProvider extends ChangeNotifier {
  String _baseUrl = 'https://valorant-api.com/v1/agents';
  String _language = 'es-MX';
  bool _isPlayableCharacter = true;

  List<Agente> agentes = [];

  AgenteProvider() {
    getAgentes();
  }

  Future<void> getAgentes() async {
    final url = Uri.parse('$_baseUrl?language=$_language&isPlayableCharacter=$_isPlayableCharacter');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      agentes = (decodedData['data'] as List).map((item) => Agente.fromJson(item)).toList();
      notifyListeners(); 
    } else {
      print('Error al obtener los agentes. Código de respuesta: ${response.statusCode}');
    }
  }
}
