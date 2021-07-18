import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuracion extends StatefulWidget {
  @override
  _ConfiguracionState createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            color: systemInf.colorFondoPrincipal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Configuracion",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon.png'),
                ),
                Text(
                  "Gracias por utilizar Amnesia!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Ante cualquier problema o sugerencia",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: systemInf.colorCajonPasswords,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Cambiar tema",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawMaterialButton(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            constraints: BoxConstraints(minWidth: 0),
                            onPressed: () {
                              systemInf.setTheme(2);
                            },
                            shape: CircleBorder(),
                            fillColor: Colors.white,
                            child: Container(
                              height: 60,
                              width: 60,
                            ),
                          ),
                          RawMaterialButton(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            constraints: BoxConstraints(minWidth: 0),
                            onPressed: () {
                              systemInf.setTheme(0);
                            },
                            shape: CircleBorder(),
                            fillColor: Color.fromARGB(255, 7, 90, 84),
                            child: Container(
                              height: 60,
                              width: 60,
                            ),
                          ),
                          RawMaterialButton(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            constraints: BoxConstraints(minWidth: 0),
                            onPressed: () {
                              systemInf.setTheme(1);
                            },
                            shape: CircleBorder(),
                            fillColor: Colors.black,
                            child: Container(
                              height: 60,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
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
