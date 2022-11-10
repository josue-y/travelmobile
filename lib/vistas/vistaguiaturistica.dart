import 'package:ejemplo_2/vistas/vistasitionuevo.dart';
import 'package:flutter/material.dart';

class SitiosTuristicos extends StatefulWidget {
  const SitiosTuristicos({Key? key}) : super(key: key);

  @override
  State<SitiosTuristicos> createState() => _SitiosTuristicosState();
}

class _SitiosTuristicosState extends State<SitiosTuristicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sitios a Visitar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NuevoSitio()));
        },
        tooltip: "Nuevo Sitio",
        child: const Icon(Icons.add),
      ),
    );
  }
}
