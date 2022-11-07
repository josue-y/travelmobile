import 'package:ejemplo_2/modelos/user.dart';
import 'package:ejemplo_2/vistas/vistapoi.dart';
import 'package:ejemplo_2/vistas/vistaregistro.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VistaLogin extends StatefulWidget {
  const VistaLogin({Key? key}) : super(key: key);

  @override
  State<VistaLogin> createState() => _VistaLoginState();
}

class _VistaLoginState extends State<VistaLogin> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  Users userloader = Users.Vacio();

  void initState (){
    obtenerUser();
    super.initState();
  }

  obtenerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("users")!);
    userloader = Users.fromJson(userMap);
  }


  void mostrarMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }



  void validarUser() {
    if (_email == userloader.email && _password == userloader.password) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => VistaPoi()));
    }else {
      mostrarMsg("Correo o contraseña invalidas");
    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                        "imagenes/viaje.jpg",
                      )),
                    ),
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo electrónico'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        validarUser();



                      },
                      child: const Text('Iniciar sesión')),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VistaRegistro()));
                    },
                    child: const Text('Registrese'),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
