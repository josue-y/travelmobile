import 'package:flutter/material.dart';
class WColumna extends StatelessWidget{
  const WColumna({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("imagenes/montaña.png",width: 210,),
          Text("TRAVELMOBILE",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontFamily: "miletra"
            ),
          ),
          Text("CIUDAD: Medellin." '\n' '\n'
              "DEPARTAMENTO: Antioquia." '\n' '\n'
              "TEMPERATURA:22°" '\n' '\n'
              "DESCRIPCION: Estamos ubicados en la hermosa ciudad de las flores, contamos con excelentes servicios.",

            style: TextStyle(
                fontSize: 20,
                fontFamily: "miletra",
                color: Colors.black26

            ),
          )



        ],
      ),
    );

  }
}