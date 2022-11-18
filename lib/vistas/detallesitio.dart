import 'package:ejemplo_2/modelos/clasesitio.dart';
import 'package:ejemplo_2/modelos/regionesdetalle.dart';
import 'package:flutter/material.dart';



class DetalleSitio extends StatelessWidget {
  final RegionesDetall regionesDetall;

  const DetalleSitio(this.regionesDetall);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(regionesDetall.nombre ?? "Detalle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                regionesDetall.foto ?? "",
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Image(
                    image: AssetImage('assets/imagenes/udea.png'),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Departamento: ${regionesDetall.departamento}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Región : ${regionesDetall.region}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Descripción: ${regionesDetall.descripcion ?? "Sin descripción"}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
