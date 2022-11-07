import 'package:ejemplo_2/modelos/user.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VistaRegistro extends StatefulWidget {
  const VistaRegistro({Key? key}) : super(key: key);

  @override
  State<VistaRegistro> createState() => _VistaRegistroState();
}

enum Genero { masculino, femenino }

class _VistaRegistroState extends State<VistaRegistro> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repetirPassword = TextEditingController();

  String _data = "Información: ";

  Genero? _genre = Genero.masculino;

  bool _aventura = false;
  bool _fantasia = false;
  bool _terror = false;

  String botonMsg = "Fecha de nacimiento";

  String _date = "";

  String converIdiomaFecha(DateTime newDate) {
    final DateFormat formato = DateFormat('yyyy-MM-dd');
    final String datoFormateado = formato.format(newDate);
    return datoFormateado;
  }

  void seleccionarFecha() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _date = converIdiomaFecha(newDate);
        botonMsg = "Fecha de nacimiento: ${_date.toString()}";
      });
    }
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

  void guardarUser(Usuario usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("usuario", jsonEncode(usuario));
    //var result = await firebase.registerUser(user.email, user.password);
  }

  void botonRegistro() {
    setState(() {
      if (_password.text == _repetirPassword.text) {
        String genre = "Masculino";
        String favoritos = "";

        if (_genre == Genero.femenino) {
          genre = "Femenino";
        }

        if (_aventura) favoritos = "$favoritos Aventura";
        if (_fantasia) favoritos = "$favoritos Fantasia";
        if (_terror) favoritos = "$favoritos Terror";
        var usuario = Usuario(_email.text, _password.text);
        guardarUser(usuario);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => VistaLogin()));
      } else {
        mostrarMsg("Las contraseñas no coinciden");
      }
    });
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
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _repetirPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repita contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Masculino'),
                          leading: Radio<Genero>(
                              value: Genero.masculino,
                              groupValue: _genre,
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Femenino'),
                          leading: Radio<Genero>(
                              value: Genero.femenino,
                              groupValue: _genre,
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Sitios de interés "Medellin"',
                    style: TextStyle(fontSize: 20),
                  ),
                  CheckboxListTile(
                    title: const Text('Individual'),
                    value: _aventura,
                    selected: _aventura,
                    onChanged: (bool? value) {
                      setState(() {
                        _aventura = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Con amigos'),
                    value: _fantasia,
                    selected: _fantasia,
                    onChanged: (bool? value) {
                      setState(() {
                        _fantasia = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('En familia'),
                    value: _terror,
                    selected: _terror,
                    onChanged: (bool? value) {
                      setState(() {
                        _terror = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      seleccionarFecha();
                    },
                    child: Text(botonMsg),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>VistaRegistro()));
                    },
                    child: const Text("Registrar"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
