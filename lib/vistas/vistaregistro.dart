import 'package:ejemplo_2/vistas/user.dart';
import 'package:ejemplo_2/vistas/vistalogin.dart';
import 'package:flutter/material.dart';
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
  final namelogin = TextEditingController();
  final emaillogin = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();
  String data = "Infomacion :";
  Genero? _genero = Genero.masculino;
  bool aventura = false;
  bool fantasia = false;
  bool terror = false;
  String btnMsg = "Fecha de nacimiento";
  String fecha = "";

  String conversonrfecha(DateTime newDate) {
    final DateFormat formato = DateFormat("yyyy-MM-dd");
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
      helpText: "Fecha de Nacimeinto",
    );
    if (newDate != null) {
      setState(() {
        fecha = conversonrfecha(newDate);
        btnMsg = "Fecha de nacimiento: ${fecha.toString()}";
      });
    }
  }

  void ponerMsj(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(msg),
          action: SnackBarAction(
            label: "Aceptar",
            onPressed: scaffold.hideCurrentSnackBar,
          )),
    );
  }

  void guardarUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  void BotonRegistro() {
    setState(() {
      if (password.text == repassword.text) {
        String genero = "Maculino";
        String favoritos = "";
        if (_genero == Genero.femenino) {
          genero = "Femenino";
        }
        if (aventura) favoritos = "$favoritos Aventura";
        if (fantasia) favoritos = "$favoritos Fantasia";
        if (terror) favoritos = "$favoritos Terror";
        var usuario = User(
            namelogin.text, emaillogin, password, genero, favoritos, fecha);
        guardarUser(usuario);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => VistaLogin()));
      } else {
        ponerMsj("Las contraseñas no coinciden");
        // data =
        //     "Nombre: ${namelogin.text} \nCorreo : ${emaillogin.text} \nGenero: $genero \nGenero favoritos: $favoritos \nFecha de Nacimiento: $fecha ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                      "imagenes/dado.jpeg",
                    )),
                  ),
                ),
                TextFormField(
                  controller: namelogin,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Nombre"),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: emaillogin,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Correo"),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Contraseña"),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: repassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Repita Contraseña"),
                  keyboardType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                          title: const Text("Masculino"),
                          leading: Radio<Genero>(
                              value: Genero.masculino,
                              groupValue: _genero,
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genero = value;
                                });
                              })),
                    ),
                    Expanded(
                      child: ListTile(
                          title: const Text("Femenino"),
                          leading: Radio<Genero>(
                              value: Genero.femenino,
                              groupValue: _genero,
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genero = value;
                                });
                              })),
                    ),
                  ],
                ),
                Text(
                  "Generos Favoritos",
                  style: TextStyle(fontSize: 20),
                ),
                CheckboxListTile(
                    title: const Text("Aventura"),
                    value: aventura,
                    selected: aventura,
                    onChanged: (bool? value) {
                      setState(() {
                        aventura = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Fantasia"),
                    value: fantasia,
                    selected: fantasia,
                    onChanged: (bool? value) {
                      setState(() {
                        fantasia = value!;
                      });
                    }),
                CheckboxListTile(
                    title: const Text("Terror"),
                    value: terror,
                    selected: terror,
                    onChanged: (bool? value) {
                      setState(() {
                        terror = value!;
                      });
                    }),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: "contenido",
                    ),
                  ),
                  onPressed: () {
                    seleccionarFecha();
                  },
                  child: Text(btnMsg),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontFamily: "contenido",
                    ),
                  ),
                  onPressed: () {
                    BotonRegistro();
                  },
                  child: const Text("Registrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
