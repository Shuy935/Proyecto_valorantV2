import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/models/mapa.dart';
import 'package:outlined_text/outlined_text.dart';

class SwipperMap extends StatelessWidget {
  final List<MapaV>? mapa;
  const SwipperMap({Key? key, this.mapa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mapa == null) {
      return CircularProgressIndicator();
    } else {
      final size = MediaQuery.of(context).size;
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.8,
        child: Swiper(
          itemCount: mapa?.length ?? 0,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.5,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final map = mapa![index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'mapa', arguments: map);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/foto.jpeg'),
                      image: NetworkImage(map.listViewIcon),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    child: OutlinedText(
                      text: Text(
                        map.displayName,
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
