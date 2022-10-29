import 'package:flutter/material.dart';


class Titulo extends StatefulWidget {
  const Titulo({Key? key}) : super(key: key);

  @override
  State<Titulo> createState() => _TituloState();
}

class _TituloState extends State<Titulo> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            width: 250,
            height: 100,
            // color:Colors.indigo ,
            margin: EdgeInsets.only(top: 35),
            child: Text(" Informatica & Electronica",
              style: TextStyle(
                  fontFamily: "titulo",
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
              textAlign: TextAlign.center,
            ),

          ),
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("imagenes/dado.jpeg"
                    )
                )
            ),
          )
        ],
      );
  }

}
