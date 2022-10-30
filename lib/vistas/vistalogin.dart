import 'package:ejemplo_2/vistas/vistaregistro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VistaLogin extends StatefulWidget {
  const VistaLogin({Key? key}) : super(key: key);

  @override
  State<VistaLogin> createState() => _VistaLoginState();
}

class _VistaLoginState extends State<VistaLogin> {
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;


  final email = TextEditingController();
  final contrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                    "imagenes/dado.jpeg",
                  )),
                ),
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo Electronico"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: contrasena,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Contraseña"),
              ),
              const SizedBox(
                height: 16.0,
              ),


              ElevatedButton(
                  onPressed: () {}, child: const Text("iniciar Sesión")),
              TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: "contenido",
                        fontStyle: FontStyle.normal,
                        color: Colors.cyan)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VistaRegistro()));
                },
                child: const Text("Resgistrarse"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
