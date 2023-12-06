import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/models/agente.dart';
import 'package:login_moviles2/models/favoritos.dart';

class AgenteDetails extends StatefulWidget {
  final List<Agente>? agente;
  final Map<String, dynamic> favoritosData;

  const AgenteDetails({Key? key, this.agente, required this.favoritosData})
      : super(key: key);

  @override
  _AgenteDetailsState createState() => _AgenteDetailsState();
}

class _AgenteDetailsState extends State<AgenteDetails> {
  @override
  Widget build(BuildContext context) {
    final Agente agente =
        ModalRoute.of(context)?.settings.arguments as Agente;
    return Container(
      child: FlipCardA(
        agente: agente,
        favoritosData: widget.favoritosData,
      ),
    );
  }
}

class FlipCardA extends StatelessWidget {
  final Agente agente;
  final Map<String, dynamic> favoritosData;

  const FlipCardA(
      {Key? key, required this.agente, required this.favoritosData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Front(agente: agente, favoritosData: favoritosData),
      back: Back(agente: agente),
    );
  }
}

class Front extends StatelessWidget {
  final Agente agente;
  final Map<String, dynamic> favoritosData;

  const Front({Key? key, required this.agente, required this.favoritosData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Colores;
    Colores = agente.backgroundGradientColors[1];
    Colores = Colores.substring(0, Colores.length - 2);
    return Column(
      children: [
        Container(
          height: 25,
        ),
        Container(
          color: Color(int.parse("0xFF$Colores")),
          child: FadeInImage(
            placeholder: AssetImage('assets/foto.jpeg'),
            image: NetworkImage(agente.displayIcon),
            height: 250,
          ),
        ),
        Container(height: 15),
        Text(
          'Nombre: ' + agente.displayName,
          style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Valorant',
            fontSize: 30,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            agente.description,
            style: const TextStyle(
              color: Colors.red,
              fontFamily: 'Valorant',
              fontSize: 15,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            (favoritosData['agentes'] ?? []).contains(agente.uuid)
                ? Icons.star
                : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            print("Botón presionado");
            toggleFavorite('agentes', agente.displayIcon);
          },
        ),
      ],
    );
  }
}

class Back extends StatelessWidget {
  final Agente agente;
  const Back({Key? key, required this.agente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String Colores;
    Colores = agente.backgroundGradientColors[3];
    Colores = Colores.substring(0, Colores.length - 2);
    return Column(
      children: [
        Container(
          height: 50,
        ),
        Container(
          color: Color(int.parse("0xFF$Colores")),
          child: FadeInImage(
            placeholder: AssetImage('assets/foto.jpeg'),
            image: NetworkImage(agente.displayIcon),
            height: 250,
          ),
        ),
        Container(height: 15),
        Text(
          'Nombre del desarrollador: \n' + agente.developerName,
          style: const TextStyle(
            color: Colors.red,
            fontFamily: 'Valorant',
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
