import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class SystemInfo with ChangeNotifier {
  bool _mostrarPass = false;

  get mostrarPass {
    return _mostrarPass;
  }

  set mostrarPass(bool valor) {
    this._mostrarPass = valor;

    notifyListeners();
  }
}
