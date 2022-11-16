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
                    labelText: "Digite Departamento o Código Dane"),
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
                child: const Text("Buscar Ciudad"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listSitios.length,
                  itemBuilder: (BuildContext context, int index) {
                    Items sitio = listSitios[index];
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          'https://picsum.photos/seed/picsum/200/300' ?? "",
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Image(
                              image: AssetImage('assets/images/colombia.jpg'),
                            );
                          },
                        ),
                        title: Text(sitio.municipio ?? "Sin título"),
                        subtitle: Text(
                            sitio.cDigoDaneDelMunicipio ?? "Sin código dane"),
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
