import 'package:flutter/material.dart';

class VistaPoi extends StatelessWidget {
  const VistaPoi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                    "imagenes/medellin.jpg",
                  )),
            ),
          ),


          Text(
            "TRAVELMOBILE",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: "contenido"),
          ),

          Text(
            "CIUDAD: Medellin."
            '\n'
            '\n'
            "DEPARTAMENTO: Antioquia."
            '\n'
            '\n'
            "TEMPERATURA:22°"
            '\n'
            '\n'
            "DESCRIPCION: Estamos ubicados en la hermosa ciudad de las flores, contamos con excelentes servicios.",
            style: TextStyle(
                fontSize: 20, fontFamily: "miletra", color: Colors.black),
          )
        ],
      )),
    );
  }
}
