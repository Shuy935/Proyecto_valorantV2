import 'package:flutter/material.dart';
import 'package:login_moviles2/models/favoritos.dart';
import 'package:login_moviles2/models/mapa.dart';
import 'package:outlined_text/outlined_text.dart';

class Mapa extends StatelessWidget {
  final List<MapaV>? mapa;
  final Map<String, dynamic> favoritosData= {};
  Mapa({super.key, this.mapa});

  @override
  Widget build(BuildContext context) {
    final MapaV mapa = ModalRoute.of(context)?.settings.arguments as MapaV;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: OutlinedText(
          text: Text(
            'Mapa',
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
              image: NetworkImage(mapa.listViewIcon),
            ),
          ),
          Container(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nombre: ',
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 20,
                ),
              ),
              Text(
                mapa.displayName,
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ubicacion: ',
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 20,
                ),
              ),
              Text(
                mapa.coordinates.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(height: 10),
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
              textAlign: TextAlign.left,
              '${mapa.narrativeDescription}',
              style: const TextStyle(
                color: Colors.red,
                fontFamily: 'Valorant',
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
                icon: Icon(
                  (favoritosData['mapas'] ?? []).contains(mapa.uuid)
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  print("Botón presionado");
                  toggleFavorite('mapas', mapa.listViewIcon);
                },
              ),
        ],
      ),
    );
  }
}
