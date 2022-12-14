import 'package:ejemplo_2/modelos/sitioslocal.dart';
import 'package:ejemplo_2/vistas/busquedasitio.dart';
import 'package:ejemplo_2/vistas/sitiosturisticos.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:ejemplo_2/vistas/vistaregistrouser.dart';
import 'package:ejemplo_2/vistas/addsitionuevo.dart';
import 'package:ejemplo_2/vistas/vistasplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

Future <void> main() async { //Funcionó sin Future<> void main
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  Hive.registerAdapter(SitioLocalAdapter());
  await Hive.openBox<SitioLocal>('favoritos');


  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel Mobile",
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale("en", "US"), Locale("es", "CO")],
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const VistaSplash(),
    );
  }
}
