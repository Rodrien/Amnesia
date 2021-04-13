import 'package:amnesia/pages/paginaEditar.dart';
import 'package:flutter/material.dart';
import 'package:amnesia/DatabaseHelper.dart';
import 'package:flutter/services.dart';
import 'package:amnesia/pages/inicio.dart';
import 'package:amnesia/model/entrada.dart';
import 'package:amnesia/listaBloc.dart';

class Lista extends StatefulWidget {
  //final bool passOcultas;
  //Lista(this.plataFormas, this.passOcultas);

  Lista();
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final lista = ListaBloc();

  @override
  void dispose() {
    lista.dispose();
    super.dispose();
  }

  Color aux = Color.fromARGB(255, 7, 90, 84); //fondo lista
  Color aux2 = Color.fromARGB(255, 4, 74, 66); //color tarjeta

  //Color aux = Color.fromARGB(255, 4, 74, 66);
  //Color aux2 = Color.fromARGB(255, 7, 94, 84);

  var valores;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 5, left: 5, right: 5),
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        color: aux,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      //color: Colors.white,
      child: StreamBuilder<List<Entrada>>(
        stream: lista.lista,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                padding:
                    EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: ObjectKey(snapshot.data[index].id),
                    background: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    secondaryBackground: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(Icons.update_outlined,
                          color: Colors.greenAccent),
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                    onDismissed: (directon) {
                      _eliminarEntrada(snapshot.data[index]);
                      setState(() {
                        snapshot.data.removeAt(index);
                      });
                    },
                    confirmDismiss: (DismissDirection direction) async {
                      switch (direction) {
                        case DismissDirection.startToEnd:
                          return _confirmacionEliminar();
                        case DismissDirection.endToStart:
                          //Aca actualizar la entrada
                          return pantallaEditar(
                              snapshot.data[index].id,
                              snapshot.data[index].plataForma,
                              snapshot.data[index].titulo,
                              snapshot.data[index].usuario,
                              snapshot.data[index].password);
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
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Material(
                          color: aux2,
                          elevation: 1,
                          child: InkWell(
                            //enableFeedback: true,
                            //focusColor: Colors.greenAccent,
                            //hoverColor: Colors.red,
                            //highlightColor: Colors.greenAccent,
                            splashColor: Colors.greenAccent,
                            child: ListTile(
                              tileColor: Color.fromARGB(1, 7, 94, 84),
                              key: ObjectKey(snapshot.data[index].id),
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                      text: snapshot.data[index].password),
                                );
                              },
                              onLongPress: () {
                                Clipboard.setData(
                                  ClipboardData(
                                      text: snapshot.data[index].password),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Contraseña copiada al portapapeles",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 4, 74, 66),
                                      );
                                    });
                              },
                              contentPadding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 15, right: 15),
                              hoverColor: Colors.greenAccent,
                              leading: Container(
                                child: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                      'assets/images/${snapshot.data[index].plataForma}_icon.png'),
                                ),
                              ),
                              isThreeLine: true,
                              title: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${snapshot.data[index].titulo}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "${snapshot.data[index].usuario}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n" +
                                          (passOcultas
                                              ? "${snapshot.data[index].password}"
                                              : "*" *
                                                  snapshot.data[index].password
                                                      .length),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              trailing: Container(
                                height: double.infinity,
                                child: Icon(
                                  //Cuando se toca cambia el estado de favorito de la BD y actualiza la lista
                                  Icons.star,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _eliminarEntrada(dynamic entrada) {
    DatabaseHelper.instance.deleteEntrada(entrada.id);
    //Navigator.pop(context);
  }

  Future<bool> _confirmacionEliminar() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 15, 15, 15),
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
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                "ELIMINAR",
                style: TextStyle(color: Colors.redAccent),
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
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return PaginaEditar(id, plat, tit, usu, pass);
        },
      ),
    );
  }
}
