import 'package:amnesia/model/entrada.dart';
import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DissmissCard extends StatelessWidget {
  //final AsyncSnapshot<dynamic> snapshot;
  final Entrada datos;
  final int index;

  const DissmissCard({Key key, @required this.datos, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    final database = Provider.of<LocalDatabase>(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          color: systemInf.colorFondoPasswords,
          elevation: 1,
          child: ListTile(
            tileColor: Color.fromARGB(1, 7, 94, 84),
            key: ObjectKey(datos.id),
            onTap: () {
              Clipboard.setData(
                ClipboardData(text: datos.password),
              );
              final snackBar = SnackBar(
                content: Text('Contraseña copiada al portapapeles'),
                backgroundColor: systemInf.colorFondoPrincipal,
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            onLongPress: () {
              //agregar a favorito aca
              database.favEntrada(datos.id, (datos.favorito + 1) % 2);
            },
            contentPadding:
                EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
            hoverColor: Colors.greenAccent,
            leading: Container(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    AssetImage('assets/images/${datos.plataForma}_icon.png'),
              ),
            ),
            isThreeLine: true,
            title: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${datos.titulo}",
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
              maxLines: 2,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "${datos.usuario}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: "\n" +
                        (systemInf.mostrarPass
                            ? "${datos.password}"
                            : "*" * datos.password.length),
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
              child: InkWell(
                child: Icon(
                  //Cuando se toca cambia el estado de favorito de la BD y actualiza la lista
                  Icons.star,
                  color: (datos.favorito == 0
                      ? Colors.white
                      : systemInf.colorImportante),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
