import 'package:flutter/material.dart';
import 'package:login_moviles2/models/armas.dart';
import 'package:login_moviles2/models/favoritos.dart';

class ArmasD extends StatelessWidget {
  final List<Armas>? armas;
  final Map<String, dynamic> favoritosData;
  const ArmasD({super.key, this.armas, required this.favoritosData});

  @override
  Widget build(BuildContext context) {
    final Armas armas = ModalRoute.of(context)?.settings.arguments as Armas;
    String categoria = '';
    if (armas.shopData?.category.toString() == null) {
      categoria = 'Melee';
    } else {
      categoria = armas.shopData!.category.toString();
    }
    return Column(
      children: [
        Container(
          height: 25,
        ),
        Container(
          child: FadeInImage(
            placeholder: AssetImage('assets/foto.jpeg'),
            image: NetworkImage(armas.displayIcon),
            height: 250,
          ),
        ),
        Container(height: 15),
        Text(
          'Nombre: ' + armas.displayName,
          style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Valorant',
            fontSize: 30,
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tipo de arma: ',
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 15,
                ),
              ),
              Text(
                categoria,
                style: const TextStyle(
                  color: Colors.red,
                  fontFamily: 'Valorant',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            (favoritosData['armas'] ?? []).contains(armas.uuid)
                ? Icons.star
                : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            print("Botón presionado");
            toggleFavorite('armas', armas.displayIcon);
          },
        ),
      ],
    );
  }
}
