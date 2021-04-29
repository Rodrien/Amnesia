import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:amnesia/model/entrada.dart';
import 'package:amnesia/pages/mainScreen.dart';
import 'package:provider/provider.dart';

class PaginaEditar extends StatefulWidget {
  final int idActual;
  final String platActual;
  final String titActual;
  final String usuActual;
  final String passActual;
  final int favActual;

  PaginaEditar(this.idActual, this.platActual, this.titActual, this.usuActual,
      this.passActual, this.favActual);

  @override
  _PaginaEditarState createState() => _PaginaEditarState();
}

class _PaginaEditarState extends State<PaginaEditar> {
  String plataformaElegida;
  final control0 = TextEditingController();
  final control1 = TextEditingController();
  final control2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    plataformaElegida = widget.platActual;
  }

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    final systemDb = Provider.of<LocalDatabase>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: systemInf.colorFondoPrincipal,
        appBar: AppBar(
          toolbarHeight: 60,
          iconTheme: IconThemeData(
            color: Colors.white, //color de la flecha de regreso
          ),
          elevation: 0,
          backgroundColor: systemInf.colorFondoPrincipal,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "Actualizar",
                  style: TextStyle(
                    fontSize: 20,
                    color: systemInf.colorImportante,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ),
                ),
                TextSpan(
                  text: " logo",
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
        ),
        body: Container(
          color: systemInf.colorFondoPrincipal,
          child: Column(
            children: [
              selectorPlataformas(
                systemInf.colorCajonPasswords,
                systemInf.colorImportante,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                ),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Actualizar",
                        style: TextStyle(
                          fontSize: 20,
                          color: systemInf.colorImportante,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1,
                        ),
                      ),
                      TextSpan(
                        text: " entrada",
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
              tarjeta(widget.titActual, control0, systemInf.colorFondoPrincipal,
                  systemInf.colorCajonPasswords),
              tarjeta(widget.usuActual, control1, systemInf.colorFondoPrincipal,
                  systemInf.colorCajonPasswords),
              tarjeta(widget.passActual, control2,
                  systemInf.colorFondoPrincipal, systemInf.colorCajonPasswords),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: systemInf.colorCajonPasswords,
          child: Icon(Icons.save_rounded, color: Colors.white),
          onPressed: () {
            if (control0.text != '' &&
                control1.text != '' &&
                control2.text != '') {
              systemDb.updateEntrada(
                Entrada(
                    id: widget.idActual,
                    titulo: control0.text,
                    usuario: control1.text,
                    password: control2.text,
                    plataForma: plataformaElegida,
                    favorito: widget.favActual),
              );
            } else {
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
                      "Error al actualizar",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
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
                  color: Colors.black12,
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
            controller: controlador..text = selector,
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
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
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
                        color: eleccion,
                        spreadRadius: 5,
                        blurRadius: 7,
                      )
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
      ),
    );
  }
}
