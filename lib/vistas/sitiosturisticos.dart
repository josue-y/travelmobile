import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_2/modelos/clasesitio.dart';
import 'package:ejemplo_2/modelos/regionesdetalle.dart';
import 'package:ejemplo_2/vistas/detallesitio.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:ejemplo_2/vistas/addsitionuevo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../repositorio/firebase_api.dart';

class SitiosTuristicos extends StatefulWidget {
  const SitiosTuristicos({Key? key}) : super(key: key);

  @override
  State<SitiosTuristicos> createState() => _SitiosTuristicosState();
}

enum Menu { cierreSesion }

class _SitiosTuristicosState extends State<SitiosTuristicos> {
  final Firebase objectFirebaseUser = Firebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sitios a visitar"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Usuarios")
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .collection("Sitios")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error en la consulta");
              if (!snapshot.hasData) return const Text("Cargando!");
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot sitio = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      title: Text(sitio["nombre"]),
                      subtitle: Text(sitio["region"]),
                      leading: Image.network(
                        sitio['foto'] ?? "",
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Image(
                            image: AssetImage('assets/imagenes/udea.png'),
                          );
                        },
                      ),
                      onTap: () {
                        RegionesDetall regionesDetall = RegionesDetall(sitio ["uid"],sitio['nombre'], sitio['foto'], sitio['departamento'], sitio['region'], sitio['descripcion'], sitio['clima']);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetalleSitio(regionesDetall)));
                      },
                    ),
                  );
                },
              );
            },
          )),
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
