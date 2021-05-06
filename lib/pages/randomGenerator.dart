import 'dart:convert';
import 'dart:math';

import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Utils {
  static final Random _random = Random.secure();

  static String createCryptoRandomString([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));

    return base64Url.encode(values).substring(0, 19);
  }
}

class RandomGeneratorPage extends StatefulWidget {
  RandomGeneratorPage({Key key}) : super(key: key);

  @override
  _RandomGeneratorPageState createState() => _RandomGeneratorPageState();
}

class _RandomGeneratorPageState extends State<RandomGeneratorPage> {
  String passGenerada = "Aprete Generar";
  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: systemInf.colorFondoPrincipal,
          title: Text(
            "Generador de contraseñas",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SizedBox.expand(
          //color: systemInf.colorFondoPrincipal,

          child: Container(
            color: systemInf.colorFondoPrincipal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Al generar una contraseña, automaticamente se copia al portapeles.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  passGenerada,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: systemInf.colorCajonPasswords,
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 40, right: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Generar"),
                  onPressed: () {
                    //print(Utils.createCryptoRandomString());
                    setState(() {
                      passGenerada = Utils.createCryptoRandomString();
                    });
                    Clipboard.setData(
                      ClipboardData(
                        text: passGenerada,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
