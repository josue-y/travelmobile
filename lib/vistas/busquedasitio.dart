import 'package:flutter/material.dart';

class BusquedaSite extends StatefulWidget {
  const BusquedaSite({Key? key}) : super(key: key);

  @override
  State<BusquedaSite> createState() => _BusquedaSiteState();
}

class _BusquedaSiteState extends State<BusquedaSite> {
  final _parametro = TextEditingController();

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
                onPressed: () {},
                child: const Text("Buscar Ciudad"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
