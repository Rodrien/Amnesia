import 'dart:async';
import 'model/entrada.dart';
import 'package:Amnesia/DatabaseHelper.dart';

/* Usa streamBuilder, no esta usando la libreria de BLoC */

class ListaBloc {
  ListaBloc() {
    obtenerLista();
  }
  final _listaController = StreamController<List<Entrada>>.broadcast();
  get lista => _listaController.stream;

  dispose() {
    _listaController.close();
  }

  obtenerLista() async {
    _listaController.sink.add(await DatabaseHelper.instance.retrieveEntradas());
  }

  add(Entrada entrada) {
    DatabaseHelper.instance.insertEntrada(entrada);
    obtenerLista();
  }

  delete(int id) {
    DatabaseHelper.instance.deleteEntrada(id);
    obtenerLista();
  }

  /*
  update(Password password) {
    DatabaseHelper.instance.updatePassword(password);
    obtenerLista();
  }
  deleteAll() {
    DatabaseHelper.instance.deleteAll();
    obtenerLista();
  }*/
}
