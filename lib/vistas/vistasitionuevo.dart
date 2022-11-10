import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NuevoSitio extends StatefulWidget {
  const NuevoSitio({Key? key}) : super(key: key);

  @override
  State<NuevoSitio> createState() => _NuevoSitioState();
}

class _NuevoSitioState extends State<NuevoSitio> {
  final _nombreSitio = TextEditingController();
  final _ubicacion = TextEditingController();
  final _numeroPage = TextEditingController();

  double _calificacion = 5.0;
  bool regionCaribe = false,
      regionPacifica = false,
      regionAndina = false,
      regionAmazonia = false,
      regionOrinoquia = false;

  void _guardarSitio() {}

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
                    border: OutlineInputBorder(), labelText: "Nombre Sitio"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _ubicacion,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Ubicación"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _numeroPage,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Número Página"),
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
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                  onRatingUpdate: (ubicacion) {}),
              const SizedBox(
                height: 16.0,
              ),
              const Text("Región(s) de Colombia",
                  style: TextStyle(
                    fontSize: 20,
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
                      title: const Text("Región Pacifica"),
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
