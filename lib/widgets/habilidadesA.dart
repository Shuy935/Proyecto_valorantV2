import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import '../models/agente.dart';

class HabilidadesA extends StatelessWidget {
  const HabilidadesA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Agente agente = ModalRoute.of(context)?.settings.arguments as Agente;

    return SingleChildScrollView(
      child: Column(
        children: [
          CardE(
            cantidad: agente.abilities.length,
            agente: agente,
          ),
        ],
      ),
    );
  }
}

class CardE extends StatelessWidget {
  final int cantidad;
  final Agente agente;
  const CardE({Key? key, required this.cantidad, required this.agente})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];
    String NDH = '';
    String Colores;
    Colores = agente.backgroundGradientColors[3];
    Colores = Colores.substring(0, Colores.length - 2);
    for (int index = 0; index < cantidad; index++) {
      NDH = agente.abilities[index].slot.toString();
      NDH = NDH.replaceAll('Slot.', '');
      cards.add(
        Card(
          color: Color(int.parse("0xFF$Colores")),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 120,
                          child: OutlinedText(
                            text: Text(
                              'Nombre: ',
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
                            agente.abilities[index].displayName.toString(),
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
                            NDH,
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
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/foto.jpeg'),
                        image: NetworkImage(
                            agente.abilities[index].displayIcon.toString()),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 4,
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 200,
                              child: OutlinedText(
                                text: Text(
                                  agente.abilities[index].description,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontFamily: 'Valorant',
                                  ),
                                ),
                                strokes: [
                                  OutlinedTextStroke(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 3,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      children: cards,
    );
  }
}
