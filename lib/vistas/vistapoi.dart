import 'package:ejemplo_2/vistas/sitiosturisticos.dart';
import 'package:ejemplo_2/vistas/addsitionuevo.dart';
import 'package:flutter/material.dart';

class VistaPoi extends StatelessWidget {
  const VistaPoi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sitio Turístico"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                    "imagenes/medellin.jpg",
                  )),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Medellín",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: "contenido"),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text("Ciudad : Medelllin",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              const Text("Departamento: Antioquia",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              const Text("Temperatura: 22°",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                  "Tradición arriera y herencia floricultora de más de 50 años, clima primaveral para la flora urbana, gran comercio de flores y embellecidos parques públicos y jardines convierten a Medellín en la ciudad de las flores.",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const SitiosTuristicos()));
                },
                child: const Text("Agregar Sitio"),
              )
            ],
          )),
        ));
  }
}
