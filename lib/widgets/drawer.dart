import 'package:flutter/material.dart';
import 'package:login_moviles2/screens/Favoritos.dart';

class DrawerA extends StatelessWidget {
  final VoidCallback onAgenteClick;
  final VoidCallback onArmasClick;
  final VoidCallback onEquipoClick;
  final VoidCallback onMapaClick;
  final VoidCallback onModoClick;

  DrawerA(
      {required this.onAgenteClick,
      required this.onArmasClick,
      required this.onEquipoClick,
      required this.onModoClick,
      required this.onMapaClick});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Text(
              'VALORANT',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Valorant',
                color: Colors.red,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Favoritos',
              style: TextStyle(
                fontFamily: 'valorant',
                color: Color.fromARGB(255, 178, 6, 6),
                fontSize: 24.0,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.star),
              color: Colors.yellow,
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favoritos()),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Agentes',
            style: TextStyle(
              fontFamily: 'valorant',
              color: Color.fromARGB(255, 178, 6, 6),
              fontSize: 24.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              onAgenteClick();
              Navigator.pop(context);
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/foto.jpeg'),
              image: AssetImage('assets/Agente.png'),
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Armas',
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 178, 6, 6),
              fontFamily: 'Valorant',
            ),
          ),
          GestureDetector(
            onTap: () {
              onArmasClick();
              Navigator.pop(context);
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/foto.jpeg'),
              image: AssetImage('assets/Weapons.png'),
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Equipamento',
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 178, 6, 6),
              fontFamily: 'Valorant',
            ),
          ),
          GestureDetector(
            onTap: () {
              onEquipoClick();
              Navigator.pop(context);
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/foto.jpeg'),
              image: AssetImage('assets/Gear.png'),
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Mapas',
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 178, 6, 6),
              fontFamily: 'Valorant',
            ),
          ),
          GestureDetector(
            onTap: () {
              onMapaClick();
              Navigator.pop(context);
            },
            child: FadeInImage(
              placeholder: AssetImage('assets/foto.jpeg'),
              image: AssetImage('assets/Map.png'),
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
