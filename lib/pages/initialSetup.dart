/*
  Aca elegir la contrase;a maestra
  elegir el default tema (claro/oscuro)
  

*/

import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setup extends StatelessWidget {
  const Setup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            color: systemInf.colorFondoPrincipal,
            child: Column(
              children: [
                Text("Ingrese su clave maestra"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Confirmar"),
                ),
                Text("Recuerde esta clave bla bla")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
