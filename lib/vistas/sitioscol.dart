import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:ejemplo_2/vistas/sitionuevo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../repositorio/firebase.dart';

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
        title: Text("Sitios a Visitar"),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item) {
              setState(() {
                if (item == Menu.cierreSesion) {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VistaLogin()));
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                value: Menu.cierreSesion,
                child: Text("Cerrar Sesión"),
              )
            ],
          ),
        ],
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
              if (!snapshot.hasData) return const Text("Cargando");
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot sitio = snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      title: Text(sitio["nombre"]),
                      subtitle: Text(sitio["region"]),
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