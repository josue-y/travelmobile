import 'package:ejemplo_2/boxfavoritos.dart';
import 'package:ejemplo_2/modelos/sitioslocal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class VistaFavoritos extends StatefulWidget {
  const VistaFavoritos({Key? key}) : super(key: key);

  @override
  State<VistaFavoritos> createState() => _VistaFavoritosState();
}

class _VistaFavoritosState extends State<VistaFavoritos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<SitioLocal>>(
      valueListenable: Boxes.obtenerFavoritos().listenable(),
      builder: (context, box, _) {
        final sitioBox = box.values.toList().cast<SitioLocal>();
        return ListView.builder(
          itemCount: sitioBox.length,
          itemBuilder: (context, index) {
            final sitio = sitioBox[index];
            return Card(
              child: ListTile(
                leading: Image.network(
                  sitio.linkimage ?? "",
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Image(
                      image: AssetImage('assets/imagenes/udea.png'),
                    );
                  },
                ),
                title: Text(sitio.nombre ?? "Sin nombre"),
                subtitle: Text(sitio.departamento ?? "Sin departamento"),
                onLongPress: (){
                  setState(() {
                    sitio.delete();
                  });
                },
              ),
            );
          },
        );
      },
    );
  }
}
