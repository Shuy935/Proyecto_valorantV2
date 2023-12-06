import 'package:flutter/material.dart';
import 'package:login_moviles2/models/equipamento.dart';
import 'package:login_moviles2/models/favoritos.dart';
import 'package:outlined_text/outlined_text.dart';

class Equipamento extends StatelessWidget {
  final List<Equip>? equipo;
  final Map<String, dynamic> favoritosData = {};
  Equipamento({super.key, this.equipo});

  @override
  Widget build(BuildContext context) {
    final Equip equipo = ModalRoute.of(context)?.settings.arguments as Equip;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: OutlinedText(
          text: Text(
            'Equipamento',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontFamily: 'Valorant',
            ),
          ),
          strokes: [
            OutlinedTextStroke(
                color: const Color.fromARGB(255, 0, 0, 0), width: 4),
          ],
        ),
      ),
      body: Column(
      children: [
        Container(
          height: 25,
        ),
        Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/foto.jpeg'),
            image: NetworkImage(equipo.displayIcon),
            height: 250,
          ),
        ),
        Container(height: 15),
        Text(
          'Nombre: ' + equipo.displayName,
          style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Valorant',
            fontSize: 20,
          ),
        ),
        Container(height: 10),
        Text(
          'costo: '+equipo.shopData.cost.toString(),
          style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Valorant',
            fontSize: 20,
          ),
        ),
        Container(height: 25,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Descripcion: ',
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Valorant',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
          textAlign: TextAlign.justify,
                equipo.description,
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 20,
                ),
              ),),
        IconButton(
                icon: Icon(
                  (favoritosData['equipamento'] ?? []).contains(equipo.uuid)
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  print("Botón presionado");
                  toggleFavorite('equipamento', equipo.displayIcon);
                },
              ),
      ],
    ),
    );
  }
}
