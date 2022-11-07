import 'package:ejemplo_2/modelos/user.dart';
import 'package:flutter/material.dart';
class RegistroBDUsuario extends StatefulWidget{
  const RegistroBDUsuario({Key? key}) : super(key: key);

  @override
  State<RegistroRegistroBDUsuario>createState()=>_RegistroBDUsuario();
}

class_RegistroBDUsuarioState extends State<RegistroBDUsuario>{final_nombre=

TextEditingController();
final_apellido=

TextEditingController();
final_correo=

TextEditingController();
final_celular=

TextEditingController();


@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  //child:Titulo(),
                ),
                TextFormField(
                  controller: _nombre,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nombre"),
                ),
                SizedBox(
                  height: 16,

                ),
                TextFormField(
                  controller: _apellido,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Apellido"),
                ),
                SizedBox(
                  height: 16,

                ),
                TextFormField(
                  controller: correo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Correo"),
                ),
                SizedBox(
                    height: 16

                ),
                TextFormField(
                  controller: _celular,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "celular"),
                ),
                SizedBox(
                  height: 16,

                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 15)

                  ),
                  onPressed: () {

                  },
                  child: Text("Registrate"),

                )
              ],
            ),
          ),
        ),


      )
  );
}}


