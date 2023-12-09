import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/models/armas.dart';
import 'package:outlined_text/outlined_text.dart';

class SwipperArm extends StatelessWidget {
  final List<Armas>? armas;
  const SwipperArm({Key? key, this.armas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (armas == null) {
      return CircularProgressIndicator();
    } else {
      final size = MediaQuery.of(context).size;
      return SizedBox(
        width: double.infinity,
        height: size.height,
        child: Swiper(
          itemCount: armas?.length ?? 0,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.5,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final arma = armas![index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'armas', arguments: arma);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/foto.jpeg'),
                      image: NetworkImage(arma.displayIcon),
                    ),
                  ),
                  Positioned(
                    top: 250,
                    child: OutlinedText(
                      text: Text(
                        arma.displayName,
                        style: const TextStyle(
                          fontSize: 25,
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
