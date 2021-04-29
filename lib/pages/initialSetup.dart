import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mainScreen.dart';

class Setup extends StatefulWidget {
  Setup({Key key}) : super(key: key);

  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  final input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    final dataBase = Provider.of<LocalDatabase>(context);
    return SafeArea(
      child: Scaffold(
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
                    "Contraseña Maestra",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Para comenzar seleccione su contraseña maestra.\n Recuerde que esta contraseña la debe recordar " +
                      "ya que con ella accedera a todas las demas contraseñas almacenadas.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
                        backgroundColor: MaterialStateProperty.all(
                            systemInf.colorFondoPasswords)),
                    onPressed: () {
                      //setear la passmaestra, en caso que todo salga bien entonces cambio firstBoot a false
                      //y abro el inicio
                      if (input.text.length > 0) {
                        dataBase.insertMasterPassword(input.text);
                        dataBase.updateFirstBoot();
                      }
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Inicio()),
                          (route) => false);
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
