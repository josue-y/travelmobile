import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_2/vistas/detallesitiosmaps.dart';
import 'package:flutter/material.dart';

class VistaMapas extends StatefulWidget {
  const VistaMapas({Key? key}) : super(key: key);

  @override
  State<VistaMapas> createState() => _VistaMapasState();
}

class _VistaMapasState extends State<VistaMapas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("sitiosmap").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error en la consulta");
              if (!snapshot.hasData) return const Text("Cargando!");
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot sitiosmap= snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        sitiosmap["imagen"] ?? "",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Image(
                            image: AssetImage('imagenes/udea.png'),
                          );
                        },
                      ),
                      title: Text(sitiosmap["nombre"]),
                      subtitle: Text(sitiosmap["departamento"]),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => DetalleSitiosMapas(sitiosmap)));
                      },
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
