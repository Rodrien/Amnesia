import 'package:flutter/material.dart';
import 'package:amnesia/lista.dart';
import 'package:amnesia/pages/paginaAgregar.dart';

//-------------- Variables --------------
bool passOcultas = false;
List<String> genericos = [
  "Logo",
  "Estrella",
  "Mail",
  "Banco",
  "Juegos",
];
List<String> especificos = [
  "LinkedIn",
  "Windows",
  "Spotify",
  "MercadoLibre",
  "Prex",
  "MercadoPago",
  "PedidosYa",
  "Pinterest",
  "Skype",
  "Google",
  "Facebook",
  "Instagram",
  "Twitter",
  "BROU",
  "Uber",
  "Netflix",
  "Outlook",
  "PayPal",
  "BPS",
]..sort(); //Ordena en orden alfabetico

List<String> plataFormas = genericos + especificos;
//-------------- Variables --------------

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Am",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                TextSpan(
                  text: "nesia",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              splashColor: Colors.transparent,
              enableFeedback: false,
              icon: Icon(
                Icons.visibility,
                color: (passOcultas ? Colors.yellow : Colors.white),
              ),
              padding: EdgeInsets.only(right: 20),
              onPressed: () {
                //oculta/muestra las passwords
                passOcultas = !passOcultas;
                setState(() {});
              }, //Agregar pagina de informacion
            )
          ],
          elevation: 0,
          toolbarHeight: 30,
        ),
        body: Lista(),
        backgroundColor: Colors.black,

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.add_sharp, color: Colors.black),
          onPressed: () {
            pantallaAgregar();
            //setState(() {});
          },
        ),
        /*FloatingActionButton.extended(
          icon: Icon(Icons.add_sharp, color: Colors.black),
          label: Text(
            "Agregar",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.greenAccent,

          //usar el redondo por default con un logo de +

          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            pantallaAgregar();
            //setState(() {});
          },
        ),*/
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void pantallaAgregar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return PaginaAgregar();
      }),
    );
  }
}
