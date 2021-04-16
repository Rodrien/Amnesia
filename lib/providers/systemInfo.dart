import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class SystemInfo with ChangeNotifier {
  bool _mostrarPass = false;

  //------ THEME ------
  Color _colorFondoPrincipal = Color.fromARGB(255, 0, 20, 18);
  Color _colorCajonPasswords = Color.fromARGB(255, 7, 90, 84);
  Color _colorFondoPasswords = Color.fromARGB(255, 4, 74, 66); //color tarjeta

  Color _colorImportante = Color.fromARGB(255, 230, 221, 59);

  //------ THEME ------

  get mostrarPass {
    return _mostrarPass;
  }

  set mostrarPass(bool valor) {
    this._mostrarPass = valor;

    notifyListeners();
  }

  get colorFondoPrincipal {
    return _colorFondoPrincipal;
  }

  get colorCajonPasswords {
    return _colorCajonPasswords;
  }

  get colorFondoPasswords {
    return _colorFondoPasswords;
  }

  get colorImportante {
    return _colorImportante;
  }
}
