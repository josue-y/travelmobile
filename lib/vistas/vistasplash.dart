import 'package:ejemplo_2/vistas/sitiosturisticos.dart';
import 'package:ejemplo_2/vistas/vistahome.dart';
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
    Future.delayed(const Duration(seconds: 3), () async {
    var userActual = FirebaseAuth.instance.currentUser;
    if (userActual == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const VistaLogin()));
    } else {
      var iduser = (FirebaseAuth.instance.currentUser?.uid);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const VistaHome()));
      }
    }
    );
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
