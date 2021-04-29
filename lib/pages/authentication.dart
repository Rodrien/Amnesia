/*
  Iniciar aca y pedir clave maestra
*/

import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainScreen.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final input = TextEditingController();
  Color btnCol;

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    final dataBase = Provider.of<LocalDatabase>(context);
    btnCol = systemInf.colorFondoPasswords;
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
          title: Text(
            "Contraseña Maestra",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: false,
          backgroundColor: systemInf.colorFondoPasswords,
        ),*/
        body: SizedBox.expand(
          child: Container(
            color: systemInf.colorFondoPrincipal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    "Ingrese su contraseña Maestra",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: systemInf.colorFondoPasswords,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: systemInf.colorFondoPasswords,
                        ),
                      ),
                      hintText: ("contraseña"),
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                    ),
                    controller: input,
                    enableInteractiveSelection: true,
                    autofocus: false, //(selector == 1 ? true : false),
                    textAlign: TextAlign.start,
                    showCursor: true,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    maxLength: 30,
                    buildCounter: (_, {currentLength, maxLength, isFocused}) =>
                        Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          currentLength.toString() + "/" + maxLength.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    maxLines: 1,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                            left: 70,
                            right: 70,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(btnCol)),
                    onPressed: () async {
                      //si la pass ingresada es igual a la guardada entonces abro inicio, sino no
                      String mPass = await dataBase.retrieveMasterPassword();
                      if (mPass == input.text) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Inicio()),
                            (route) => false);
                      } else {
                        final snackBar = SnackBar(
                          content: Text(
                            'Contraseña incorrecta',
                            style: TextStyle(
                                color: systemInf.colorCajonPasswords,
                                fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: systemInf.colorImportante,
                          duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      "Confirmar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
