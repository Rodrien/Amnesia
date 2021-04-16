import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/providers/systemInfo.dart';
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
    final systemInf = Provider.of<SystemInfo>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: systemInf.colorFondoPrincipal,
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          //iconTheme: IconThemeData(
          //  color: Colors.white, //color de la flecha de regreso
          //),
          elevation: 0,
          backgroundColor: systemInf.colorFondoPrincipal,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Nueva",
                  style: TextStyle(
                    fontSize: 20,
                    color: systemInf.colorImportante,
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
        ),
        body: Container(
          color: systemInf.colorFondoPrincipal,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    tarjeta("Titulo", control0, systemInf.colorFondoPrincipal,
                        systemInf.colorCajonPasswords),
                    tarjeta("Usuario", control1, systemInf.colorFondoPrincipal,
                        systemInf.colorCajonPasswords),
                    tarjeta(
                        "Contraseña",
                        control2,
                        systemInf.colorFondoPrincipal,
                        systemInf.colorCajonPasswords),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Seleccione",
                        style: TextStyle(
                          fontSize: 20,
                          color: systemInf.colorImportante,
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
              selectorPlataformas(
                systemInf.colorCajonPasswords,
                systemInf.colorImportante,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: systemInf.colorFondoPrincipal,
          child: Icon(Icons.save_rounded, color: Colors.white),
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
              final snackBar = SnackBar(
                content: Text('Contraseña guardada con exito'),
                backgroundColor: systemInf.colorFondoPrincipal,
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget tarjeta(String selector, TextEditingController controlador, Color col1,
      Color col2) {
    return Container(
      color: col1,
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: col2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: col2,
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

  Widget selectorPlataformas(Color fondo, Color eleccion) {
    //un grid con los logos de cada plataforma
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          color: fondo,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        ///left right, poner las puntas curvas como inicio
        child: GridView.builder(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 30, right: 20),
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
                      BoxShadow(color: eleccion, spreadRadius: 5, blurRadius: 7)
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
      ),
    );
  }
}
