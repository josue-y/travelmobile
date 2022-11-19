import 'package:ejemplo_2/boxfavoritos.dart';
import 'package:ejemplo_2/modelos/clasesitio.dart';
import 'package:ejemplo_2/modelos/regionesdetalle.dart';
import 'package:ejemplo_2/modelos/sitioslocal.dart';
import 'package:flutter/material.dart';

class DetalleSitio extends StatefulWidget {
  final RegionesDetall regionesDetall;

  const DetalleSitio(this.regionesDetall);

  @override
  State<DetalleSitio> createState() => _DetalleSitioState();
}

class _DetalleSitioState extends State<DetalleSitio> {

  void _botonFavoritos() {
    var sitioLocal = SitioLocal()
    ..id = widget.regionesDetall.id
    ..nombre = widget.regionesDetall.nombre
        ..departamento = widget.regionesDetall.departamento
        ..descripcion = widget.regionesDetall.descripcion
        ..clima = widget.regionesDetall.clima
        ..linkimage = widget.regionesDetall.foto
        ..region = widget.regionesDetall.region;

    final box = Boxes.obtenerFavoritos();
    box.add(sitioLocal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.regionesDetall.nombre ?? "Detalle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.regionesDetall.foto ?? "",
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Image(
                    image: AssetImage('imagenes/udea.png'),
                  );
                },
              ),
              Row(
                children: [
                  Expanded(child: IconButton(
                    alignment: Alignment.center,
                    icon: const Icon(Icons.favorite_border_rounded),
                    color: Color.fromARGB(150, 255, 0, 0),
                    onPressed: (() {
                      _botonFavoritos();
                    }),
                  ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Departamento: ${widget.regionesDetall.departamento}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                      fontFamily: "contenido"),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.regionesDetall.descripcion ?? "Sin descripción",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Región: ${widget.regionesDetall.region}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Clima : ${widget.regionesDetall.clima}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        )
        ,
      )
      ,
    );
  }
}
