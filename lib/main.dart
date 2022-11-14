import 'package:ejemplo_2/vistas/busquedasitio.dart';
import 'package:ejemplo_2/vistas/sitioscol.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:ejemplo_2/vistas/vistapoi.dart';
import 'package:ejemplo_2/vistas/vistaregistrouser.dart';
import 'package:ejemplo_2/vistas/sitionuevo.dart';
import 'package:ejemplo_2/vistas/vistasplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: const BusquedaSite(),
    );
  }
}
