import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/providers/providerAge.dart';
import 'package:login_moviles2/providers/providerArm.dart';
import 'package:login_moviles2/providers/providerE.dart';
import 'package:login_moviles2/providers/providerMap.dart';
import 'package:login_moviles2/widgets/Swiper.dart';
import 'package:login_moviles2/widgets/SwiperArmas.dart';
import 'package:login_moviles2/widgets/SwiperE.dart';
import 'package:login_moviles2/widgets/drawer.dart';
import 'package:login_moviles2/widgets/swiperMa.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mostrarSwiperAgentes = false;
  bool mostrarSwiperArmas = false;
  bool mostrarSwiperEquipo = false;
  bool mostrarSwiperMapa = false;
  bool mostrarSwiperModo = false;

  @override
  Widget build(BuildContext context) {
    final agentesProvider = Provider.of<AgenteProvider>(context);
    final agentes = agentesProvider.agentes;
    final armasProvider = Provider.of<ArmasProvider>(context);
    final armas = armasProvider.armas;
    final equipoProvider = Provider.of<EquipProvider>(context);
    final equipo = equipoProvider.equipo;
    final mapasProvider = Provider.of<MapaProvider>(context);
    final mapas = mapasProvider.mapas;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          mostrarSwiperAgentes
              ? 'Agentes'
              : (mostrarSwiperArmas
                  ? 'Armas'
                  : (mostrarSwiperEquipo
                      ? 'Equipo'
                      : (mostrarSwiperMapa
                          ? 'Mapa'
                          : (mostrarSwiperModo ? 'Modo' : '')))),
          style: TextStyle(
            fontFamily: 'valorant',
            color: const Color.fromARGB(255, 49, 43, 43),
          ),
        ),
      ),
      body: mostrarSwiperAgentes
          ? SwipperA(agentes: agentes)
          : (mostrarSwiperArmas
              ? SwipperArm(armas: armas)
              : (mostrarSwiperEquipo
                  ? SwiperE(equipo: equipo)
                  : (mostrarSwiperMapa
                      ? SwipperMap(mapa: mapas)
                      : Image.asset('assets/logo.png')))),
      drawer: DrawerA(
        onAgenteClick: () {
          setState(() {
            mostrarSwiperAgentes = true;
            mostrarSwiperArmas = false;
            mostrarSwiperEquipo = false;
            mostrarSwiperMapa = false;
            mostrarSwiperModo = false;
          });
        },
        onArmasClick: () {
          setState(() {
            mostrarSwiperAgentes = false;
            mostrarSwiperArmas = true;
            mostrarSwiperEquipo = false;
            mostrarSwiperMapa = false;
            mostrarSwiperModo = false;
          });
        },
        onEquipoClick: () {
          setState(() {
            mostrarSwiperAgentes = false;
            mostrarSwiperArmas = false;
            mostrarSwiperEquipo = true;
            mostrarSwiperMapa = false;
            mostrarSwiperModo = false;
          });
        },
        onMapaClick: () {
          setState(() {
            mostrarSwiperAgentes = false;
            mostrarSwiperArmas = false;
            mostrarSwiperEquipo = false;
            mostrarSwiperMapa = true;
            mostrarSwiperModo = false;
          });
        },
        onModoClick: () {
          setState(() {
            mostrarSwiperAgentes = false;
            mostrarSwiperArmas = false;
            mostrarSwiperEquipo = false;
            mostrarSwiperMapa = false;
            mostrarSwiperModo = true;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        backgroundColor: Colors.red,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
