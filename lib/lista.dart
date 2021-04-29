import 'package:amnesia/pages/editScreen.dart';
import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:amnesia/widgets/DissmissCard.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Lista extends StatefulWidget {
  Lista();
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);

    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        color: systemInf.colorCajonPasswords,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      //color: Colors.white,
      child: Consumer<LocalDatabase>(
        builder: (context, data, child) {
          return FutureBuilder(
            future: data.retrieveEntradas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  padding:
                      EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 10),
                  itemBuilder: (BuildContext context, index) {
                    return Dismissible(
                      key: ObjectKey(snapshot.data[index].id),
                      background: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        alignment: AlignmentDirectional.centerStart,
                      ),
                      secondaryBackground: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Icon(Icons.update_outlined,
                            color: systemInf.colorImportante),
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                      onDismissed: (directon) {
                        data.deleteEntrada(snapshot.data[index].id);
                        snapshot.data.removeAt(index);
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        switch (direction) {
                          case DismissDirection.startToEnd:
                            return _confirmacionEliminar(
                                systemInf.colorFondoPrincipal,
                                systemInf.colorImportante);
                          case DismissDirection.endToStart:
                            //Aca actualizar la entrada
                            return pantallaEditar(
                                snapshot.data[index].id,
                                snapshot.data[index].plataForma,
                                snapshot.data[index].titulo,
                                snapshot.data[index].usuario,
                                snapshot.data[index].password,
                                snapshot.data[index].favorito);
                          case DismissDirection.horizontal:
                            break;
                          case DismissDirection.vertical:
                            break;
                          case DismissDirection.up:
                            break;
                          case DismissDirection.down:
                            break;
                          default:
                            break;
                        }
                        return false;
                        //return _confirmacionEliminar();
                      },
                      child: DissmissCard(
                          datos: snapshot.data[index], index: index),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }

  Future<bool> _confirmacionEliminar(Color fondo, Color importante) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: fondo,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            "Confirmar",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "Eliminar entrada?",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                "CANCELAR",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(),
              onPressed: () {
                Navigator.of(context).pop(true);
              }, //=> Navigator.of(context).pop(true),
              child: Text(
                "ELIMINAR",
                style: TextStyle(
                  color: importante,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool> pantallaEditar(
    int id,
    String plat,
    String tit,
    String usu,
    String pass,
    int fav,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return PaginaEditar(id, plat, tit, usu, pass, fav);
        },
      ),
    );
    return null;
  }
}
