import 'package:flutter/material.dart';
import 'package:login_moviles2/models/favoritos.dart';

class Favoritos extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    color: Colors.red,
    fontFamily: 'Valorant',
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'Favoritos',
          style: TextStyle(
            color: Colors.red,
            fontFamily: 'Valorant',
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: FutureBuilder<Map<String, dynamic>>(
          future: loadFavoritos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true)) {
              return Center(child: Text('No hay favoritos.'));
            } else {
              final favoritosData = snapshot.data!;
              return ListView(
                children: _buildSections(favoritosData),
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildSections(Map<String, dynamic> favoritosData) {
    List<Widget> sections = [];

    if (favoritosData.containsKey('agentes')) {
      sections.add(_buildSection(
        'Agentes favoritos',
        favoritosData['agentes'].cast<String>(),
      ));
    }

    if (favoritosData.containsKey('armas')) {
      sections.add(_buildSection(
        'Armas favoritas',
        favoritosData['armas'].cast<String>(),
      ));
    }

    if (favoritosData.containsKey('equipamiento')) {
      sections.add(_buildSection(
        'Equipamientos favoritos',
        favoritosData['equipamiento'].cast<String>(),
      ));
    }

    if (favoritosData.containsKey('mapas')) {
      sections.add(_buildSection(
        'Mapas favoritos',
        favoritosData['mapas'].cast<String>(),
      ));
    }

    return sections;
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: _textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (items.isNotEmpty)
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    items[index],
                    height: 150,
                    width: 150,
                  ),
                );
              },
            ),
          ),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "No se tiene ${title.toLowerCase()}.",
              style: _textStyle.copyWith(fontSize: 16),
            ),
          ),
      ],
    );
  }
}
