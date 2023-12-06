import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_moviles2/firebase_options.dart';
import 'package:login_moviles2/providers/providerAge.dart';
import 'package:login_moviles2/providers/providerArm.dart';
import 'package:login_moviles2/providers/providerE.dart';
import 'package:login_moviles2/providers/providerMap.dart';
import 'package:login_moviles2/screens/Agente.dart';
import 'package:login_moviles2/screens/Armas.dart';
import 'package:login_moviles2/screens/Equipamento.dart';
import 'package:login_moviles2/screens/Mapas.dart';
import 'package:login_moviles2/screens/auth_page.dart';
import 'package:login_moviles2/screens/verify_email_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        
        ChangeNotifierProvider<AgenteProvider>(
          create: (_) => AgenteProvider(),
        ),
        ChangeNotifierProvider<ArmasProvider>(
          create: (_) => ArmasProvider(),
        ),
        ChangeNotifierProvider<EquipProvider>(
          create: (_) => EquipProvider(),
        ),
        ChangeNotifierProvider<MapaProvider>(
          create: (_) => MapaProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Proyecto_Valorant',
        initialRoute: 'home',
        routes: {
          'home': (_) => MyApp(),
          'agente': (_) => AgenteS(),
          'armas': (_) => ArmasS(),
          'gear': (_) => Equipamento(),
          'mapa': (_) => Mapa(),
        },
      ),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MainPage();
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return VerifyEmailPage();
        } else {
          return AuthPage();
        }
      },
    ),
  );
}
