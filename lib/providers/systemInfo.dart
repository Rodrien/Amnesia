import 'package:amnesia/utils/userPreferences.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class SystemInfo with ChangeNotifier {
  bool _mostrarPass = false;

  //------ THEME ------
  Color _colorFondoPrincipal = Color.fromARGB(255, 0, 20, 18);
  Color _colorCajonPasswords = Color.fromARGB(255, 7, 90, 84);
  Color _colorFondoPasswords = Color.fromARGB(255, 4, 74, 66); //color tarjeta
  Color _colorImportante = Color.fromARGB(
      255, 99, 242, 232); //Color.fromARGB(255, 230, 221, 59); //yellow
  Color _colorText;
  //------ THEME ------

  void init() {
    int themeOption = UserPreferences.getTheme() ?? 0;
    this.setTheme(themeOption);
  }

  void mainTheme() {
    //------ AMNESIA THEME ------
    _colorFondoPrincipal = Color.fromARGB(255, 0, 20, 18);
    _colorCajonPasswords = Color.fromARGB(255, 7, 90, 84);
    _colorFondoPasswords = Color.fromARGB(255, 4, 74, 66);
    _colorImportante = Color.fromARGB(255, 99, 242, 232);
    //------ AMNESIA THEME ------
  }

  void darkTheme() {
    _colorFondoPrincipal = Color.fromARGB(255, 0, 0, 0);
    _colorCajonPasswords = Color.fromARGB(255, 20, 20, 20);
    _colorFondoPasswords = Color.fromARGB(255, 0, 0, 0);
    _colorImportante = Color.fromARGB(255, 99, 242, 232);
    _colorText = Color.fromARGB(255, 255, 255, 255);
  }

  void lightTheme() {
    this._colorFondoPrincipal = Color.fromARGB(255, 230, 230, 230);
    this._colorCajonPasswords = Color.fromARGB(255, 255, 255, 255);
    this._colorFondoPasswords =
        Color.fromARGB(255, 230, 230, 230); //color tarjeta
    this._colorImportante = Color.fromARGB(
        255, 99, 242, 232); //Color.fromARGB(255, 230, 221, 59); //yellow
    this._colorText = Color.fromARGB(255, 0, 0, 0);
  }

  void setTheme(int opc) {
    switch (opc) {
      case 1: //dark theme
        darkTheme();
        break;
      case 2: //light theme
        lightTheme();
        break;
      default: //amnesia theme
        mainTheme();
    }
    UserPreferences.setTheme(opc);
    notifyListeners();
  }

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
