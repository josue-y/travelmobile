import 'package:ejemplo_2/vistas/busquedasitio.dart';
import 'package:ejemplo_2/vistas/sitiosturisticos.dart';
import 'package:ejemplo_2/vistas/vistafavoritos.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VistaHome extends StatefulWidget {
  const VistaHome({Key? key}) : super(key: key);

  @override
  State<VistaHome> createState() => _VistaHomeState();
}

class _VistaHomeState extends State<VistaHome> {
  var pageAcutal = 0;
  late List<Widget> vistasPage;

  @override
  void initState() {
    _cargarVista();
    super.initState();
  }

  void _presionarOn (int page){
    setState(() {
      pageAcutal = page;
    });
  }

  void _cargarVista() {
    vistasPage = [];
    vistasPage.add(BusquedaSite());
    vistasPage.add(SitiosTuristicos());
    vistasPage.add(VistaFavoritos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lugares de Colombia"),
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
      body: IndexedStack(
        index: pageAcutal,
        children: vistasPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageAcutal,
        onTap: (page) {
          _presionarOn(page);
        },
        items: const [

          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.searchengin,
                size: 20,
              ),
              label: "Buscar"),

          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.placeOfWorship,
                size: 20,
              ),
              label: "Mis Sitios"),

          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
                size: 20,
              ),
              label: "Favoritos"),
        ],
      ),
    );
  }
}
