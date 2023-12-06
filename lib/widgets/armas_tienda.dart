import 'package:flutter/material.dart';
import 'package:login_moviles2/models/armas.dart';
import 'package:outlined_text/outlined_text.dart';

class ArmasT extends StatelessWidget {
  final List<Armas>? armas;
  ArmasT({super.key, this.armas});

  @override
  Widget build(BuildContext context) {
    final Armas armas = ModalRoute.of(context)?.settings.arguments as Armas;
    String costo = armas.shopData?.category == null
        ? 'Gratis'
        : armas.shopData!.cost.toString();

    String categoria = armas.shopData?.category == null
        ? 'Melee'
        : armas.shopData!.category.toString();

    String slot = categoria.toLowerCase() == 'melee'
        ? 'Melee'
        : [
            'pistols',
            'smgs',
            'shotguns',
            'heavy weapons',
            'rifles',
            'sniper rifles'
          ].contains(categoria.toLowerCase())
            ? 'Primaria'
            : 'Número de arma no válido';

    String firerate = armas.weaponStats?.fireRate == null
        ? 'Perate bro es melee...'
        : '${armas.weaponStats!.fireRate} d/s';

    String cargador = armas.weaponStats?.magazineSize == null
        ? 'Perate bro es melee...'
        : armas.weaponStats!.magazineSize.toString();

    String recarga = armas.weaponStats?.reloadTimeSeconds == null
        ? 'Perate bro es melee...'
        : '${armas.weaponStats!.reloadTimeSeconds} s';

    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  child: OutlinedText(
                    text: Text(
                      'Tienda : ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Valorant',
                      ),
                    ),
                    strokes: [
                      OutlinedTextStroke(
                          color: const Color.fromARGB(255, 0, 0, 0), width: 4),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      child: OutlinedText(
                        text: Text(
                          'Costo: ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontFamily: 'Valorant',
                          ),
                        ),
                        strokes: [
                          OutlinedTextStroke(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 4),
                        ],
                      ),
                    ),
                    OutlinedText(
                      text: Text(
                        costo,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 4),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      child: OutlinedText(
                        text: Text(
                          'Slot : ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontFamily: 'Valorant',
                          ),
                        ),
                        strokes: [
                          OutlinedTextStroke(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 4),
                        ],
                      ),
                    ),
                    OutlinedText(
                      text: Text(
                        slot,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 4),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 25,
                ),
                Container(
                  width: 120,
                  child: OutlinedText(
                    text: Text(
                      'Stats : ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Valorant',
                      ),
                    ),
                    strokes: [
                      OutlinedTextStroke(
                          color: const Color.fromARGB(255, 0, 0, 0), width: 4),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      child: OutlinedText(
                        text: Text(
                          'Firerate : ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontFamily: 'Valorant',
                          ),
                        ),
                        strokes: [
                          OutlinedTextStroke(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 4),
                        ],
                      ),
                    ),
                    OutlinedText(
                      text: Text(
                        firerate,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 4),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      child: OutlinedText(
                        text: Text(
                          'cargador : ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontFamily: 'Valorant',
                          ),
                        ),
                        strokes: [
                          OutlinedTextStroke(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 4),
                        ],
                      ),
                    ),
                    OutlinedText(
                      text: Text(
                        cargador,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 4),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 120,
                      child: OutlinedText(
                        text: Text(
                          'recarga : ',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontFamily: 'Valorant',
                          ),
                        ),
                        strokes: [
                          OutlinedTextStroke(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 4),
                        ],
                      ),
                    ),
                    OutlinedText(
                      text: Text(
                        recarga,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 4),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
