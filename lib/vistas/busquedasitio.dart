import 'package:ejemplo_2/modelos/regiones.dart';
import 'package:ejemplo_2/repositorio/sitio_api.dart';
import 'package:flutter/material.dart';

class BusquedaSite extends StatefulWidget {
  const BusquedaSite({Key? key}) : super(key: key);

  @override
  State<BusquedaSite> createState() => _BusquedaSiteState();
}

class _BusquedaSiteState extends State<BusquedaSite> {
  SitiosApi _sitiosObjeto = SitiosApi();
  final _parametro = TextEditingController();

  List<Items> listSitios = <Items>[];

  Future _buscarSitio() async {
    Regiones resultFuture = await _sitiosObjeto.getSitio(_parametro.text);
    setState(() {
      resultFuture.items?.forEach((element) {
        listSitios.add(element);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Regiones Api")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: _parametro,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Digite Departamento o Regíon"),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _buscarSitio();
                },
                child: const Text("Buscar Regíon"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listSitios.length,
                  itemBuilder: (BuildContext context, int index) {
                    Items regiones = listSitios[index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/travelmobile-4e339.appspot.com/o/imagenesfire%2Fbandera.jpg?alt=media&token=8855d229-efcf-43f8-abf4-04f2986bab34' ?? "",
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Image(
                              image: AssetImage('assets/imagenes/udea.png'),
                            );
                          },
                        ),
                        title: Text(regiones.municipio ?? "Sin título"),
                        subtitle: Text(
                            regiones.region ?? "Sin Regíon"),
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               DetailSearchBookPage(sitio)));
                        // },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
