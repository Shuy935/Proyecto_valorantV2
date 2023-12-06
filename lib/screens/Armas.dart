import 'package:flutter/material.dart';
import 'package:login_moviles2/models/armas.dart';
import 'package:login_moviles2/widgets/armas_details.dart';
import 'package:login_moviles2/widgets/armas_tienda.dart';
import 'package:outlined_text/outlined_text.dart';

class ArmasS extends StatelessWidget {
  final List<Armas>? armas;

  const ArmasS({super.key, this.armas});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      Column(
        children: [
          Container(height: 15),
          OutlinedText(
            text: Text(
              'Descripcion',
              style: const TextStyle(
                fontSize: 15,
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
          Container(height: 10),
        ],
      ),
      Column(
        children: [
          Container(height: 15),
          OutlinedText(
            text: Text(
              'Tienda',
              style: const TextStyle(
                fontSize: 17,
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
          Container(height: 10),
        ],
      ),
    ];
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            DefaultTabController(
              length: _tabs.length,
              child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  title: OutlinedText(
                    text: Text(
                      'Armas',
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
                  bottom: TabBar(
                    tabs: _tabs,
                    labelColor: Colors.black,
                  ),
                ),
                body: TabBarView(
                  children: [
                    ArmasD(favoritosData: {},),
                    ArmasT(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
