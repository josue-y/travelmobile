import 'package:ejemplo_2/vistas/vistaguiaturistica.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VistaSplash extends StatefulWidget {
  const VistaSplash({Key? key}) : super(key: key);

  @override
  State<VistaSplash> createState() => _VistaSplashState();
}

class _VistaSplashState extends State<VistaSplash> {
  void initState() {
    cierreSplash();
    super.initState();
  }

  Future<void> cierreSplash() async {
    var userActual = FirebaseAuth.instance.currentUser;
    if (userActual == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SitiosTuristicos()));
    } else {
      Future.delayed(const Duration(seconds: 4), () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const VistaLogin()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage("imagenes/viaje.jpg"))

              // Image(image: AssetImage("imagenes/viaje.jpg"),
              //
              //       ),
              ),
        ),
      ),
    );
  }
}
