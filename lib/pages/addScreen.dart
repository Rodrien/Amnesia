import 'package:amnesia/providers/localDatabase.dart';
import 'package:flutter/material.dart';
import 'package:amnesia/model/entrada.dart';
import 'package:amnesia/pages/start.dart';
import 'package:provider/provider.dart';

class PaginaAgregar extends StatefulWidget {
  @override
  _PaginaAgregarState createState() => _PaginaAgregarState();
}

class _PaginaAgregarState extends State<PaginaAgregar> {
  String plataformaElegida = 'Logo';
  final control0 = TextEditingController();
  final control1 = TextEditingController();
  final control2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataBase = Provider.of<LocalDatabase>(context);

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //color de la flecha de regreso
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Nueva",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                TextSpan(
                  text: "Cuenta",
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
          centerTitle: true,
          toolbarHeight: 30),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            tarjeta("Titulo", control0),
            tarjeta("Usuario", control1),
            tarjeta("Contraseña", control2),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Seleccione",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                      ),
                    ),
                    TextSpan(
                      text: " un logo",
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
            ),
            selectorPlataformas(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.greenAccent,
        icon: Icon(Icons.save_rounded, color: Colors.black),
        label: Text(
          "Guardar",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onPressed: () {
          if (control0.text != "" &&
              control1.text != "" &&
              control2.text != "") {
            dataBase.insertEntrada(
              Entrada(
                  titulo: control0.text,
                  usuario: control1.text,
                  password: control2.text,
                  plataForma: plataformaElegida,
                  favorito: 0),
            );
          }
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget tarjeta(String selector, TextEditingController controlador) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.greenAccent,
                ),
              ),
              hintText: (selector),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            controller: controlador,
            enableInteractiveSelection: true,
            autofocus: false, //(selector == 1 ? true : false),
            textAlign: TextAlign.start,
            showCursor: true,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget selectorPlataformas() {
    //un grid con los logos de cada plataforma
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.only(left: 20, top: 40, bottom: 20, right: 20),
        itemCount: plataFormas.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, crossAxisSpacing: 15, mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          if (plataformaElegida == plataFormas[index]) {
            return InkWell(
              child: Container(
                //padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.greenAccent,
                        spreadRadius: 5,
                        blurRadius: 7)
                  ],
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${plataFormas[index]}_icon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () {
                plataformaElegida = plataFormas[index];
                //print(plataformaElegida);
                setState(() {});
              },
            );
          } else {
            return InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/${plataFormas[index]}_icon.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              onTap: () {
                plataformaElegida = plataFormas[index];
                setState(() {});
              },
            );
          }
        },
      ),
    );
  }

  /*_guardarEntrada(String titu, String usu, String pass, String plat) async {
    if (titu != "" && usu != "" && pass != "") {
      DatabaseHelper.instance.insertEntrada(
        Entrada(
            titulo: titu,
            usuario: usu,
            password: pass,
            plataForma: plat,
            favorito: 0),
      );
      Navigator.pushAndRemoveUntil(
          //Estudiar esto, nose porque pero funciona ahora, actualiza lo que deberia
          context,
          MaterialPageRoute(builder: (BuildContext context) => Inicio()),
          (Route<dynamic> route) => false);
    } else {
      //Muestra mensaje de error
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 15, 15, 15),
            title: Text(
              "Error",
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              "No puede dejar campos vacios.",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );
    }
  }*/
}