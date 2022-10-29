import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:ejemplo_2/vistas/vistaregistro.dart';
import 'package:ejemplo_2/vistas/vistasplash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const SprintDos());
}

class SprintDos extends StatelessWidget {
  const SprintDos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel Mobile",
        localizationsDelegates: const[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
      supportedLocales: const[
        Locale("en", "US"),
        Locale("es", "CO")
      ],
      theme: ThemeData(


          primarySwatch: Colors.blueGrey
      ),
      home: const VistaSplash(),
    );
  }
}