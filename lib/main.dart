import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:ejemplo_2/vistas/vistaregistro.dart';
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
