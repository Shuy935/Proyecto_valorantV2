import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_moviles2/models/agente.dart';

Future<void> toggleFavorite(String type, String id) async {
  final userUid = FirebaseAuth.instance.currentUser?.uid;
  final favoritosDocRef = FirebaseFirestore.instance.collection('favoritos').doc(userUid);

  final favoritosSnapshot = await favoritosDocRef.get();
  var favoritosData = favoritosSnapshot.data() ?? {};

  final favoritosList = favoritosData[type]?.cast<String>() ?? [];
  final isFavorite = favoritosList.contains(id);

  if (isFavorite) {
    favoritosList.remove(id);
  } else {
    favoritosList.add(id);
  }

  favoritosData[type] = favoritosList;

  await favoritosDocRef.set(favoritosData);
}

Future<Map<String, dynamic>> loadFavoritos() async {
  final userUid = FirebaseAuth.instance.currentUser?.uid;
  final favoritosDocRef = FirebaseFirestore.instance.collection('favoritos').doc(userUid);

  final favoritosSnapshot = await favoritosDocRef.get();
  return favoritosSnapshot.data() ?? {};
}
