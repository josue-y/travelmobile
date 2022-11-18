import 'package:ejemplo_2/modelos/clasesitio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../repositorio/firebase.dart';

class NuevoSitio extends StatefulWidget {
  const NuevoSitio({Key? key}) : super(key: key);

  @override
  State<NuevoSitio> createState() => _NuevoSitioState();
}

class _NuevoSitioState extends State<NuevoSitio> {
  final Firebase objectFirebaseUser = Firebase();

  final _nombreSitio = TextEditingController();
  final _departamento = TextEditingController();
  final _clima = TextEditingController();
  final _descripcion = TextEditingController();

  double _calificacion = 5.0;
  bool regionCaribe = false,
      regionPacifica = false,
      regionAndina = false,
      regionAmazonia = false,
      regionOrinoquia = false;

  void mostrarMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _crearSitio(Sitio sitio) async {
    var result = await objectFirebaseUser.crearSitio(sitio);
    mostrarMsg(result);
    Navigator.pop(context);
  }

  void _guardarSitio() {
    var region = "";
    if (regionCaribe) region = "$region Región Caribe";
    if (regionPacifica) region = "$region Región Pacifíca";
    if (regionAndina) region = "$region Región Andina";
    if (regionAmazonia) region = "$region Región Amazónia";
    if (regionOrinoquia) region = "$region Región Caribe";
    var sitio = Sitio(
        "", _nombreSitio.text, _departamento.text, _clima.text, _calificacion, region, _descripcion.text) ;
    _crearSitio(sitio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Sitio"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nombreSitio,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Ciudad"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _departamento,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Departamento"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _clima,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Clima (Calído/Frío/Templado)"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _descripcion,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Descripción"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onRatingUpdate: (ubicacion) {}),
              const SizedBox(
                height: 16.0,
              ),
              const Text("Región a la cuál pertenece",
                  style: TextStyle(
                    fontSize: 18,
                  )),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Región Caribe"),
                      value: regionCaribe,
                      selected: regionCaribe,
                      onChanged: (bool? value) {
                        setState(() {
                          regionCaribe = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Región Pacífica"),
                      value: regionPacifica,
                      selected: regionPacifica,
                      onChanged: (bool? value) {
                        setState(() {
                          regionPacifica = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Región Andina"),
                      value: regionAndina,
                      selected: regionAndina,
                      onChanged: (bool? value) {
                        setState(() {
                          regionAndina = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Región Orinoquia"),
                      value: regionOrinoquia,
                      selected: regionOrinoquia,
                      onChanged: (bool? value) {
                        setState(() {
                          regionOrinoquia = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Región Amazonia"),
                      value: regionAmazonia,
                      selected: regionAmazonia,
                      onChanged: (bool? value) {
                        setState(() {
                          regionAmazonia = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _guardarSitio();
                },
                child: const Text("Guardar Sitio"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
