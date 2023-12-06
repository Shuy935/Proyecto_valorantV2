import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/models/equipamento.dart';
import 'package:outlined_text/outlined_text.dart';

class SwiperE extends StatelessWidget {
  final List<Equip>? equipo;
  const SwiperE({Key? key, this.equipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (equipo == null) {
      return CircularProgressIndicator();
    } else {
      final size = MediaQuery.of(context).size;
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.8,
        child: Swiper(
          itemCount: equipo?.length ?? 0,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.5,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final equip = equipo![index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'gear', arguments: equip);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/foto.jpeg'),
                      image: NetworkImage(equip.displayIcon),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    child: OutlinedText(
                      text: Text(
                        equip.displayName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      strokes: [
                        OutlinedTextStroke(color: const Color.fromARGB(255, 0, 0, 0), width: 4),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
