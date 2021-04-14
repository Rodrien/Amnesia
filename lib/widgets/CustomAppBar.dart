import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amnesia/providers/systemInfo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key}) : super(key: key);
  static Color colorFondo = Color.fromRGBO(1, 31, 28, 1);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);

    return AppBar(
      backgroundColor: colorFondo,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Am",
              style: TextStyle(
                fontSize: 20,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
              ),
            ),
            TextSpan(
              text: "nesia",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
              ),
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          splashColor: Colors.transparent,
          enableFeedback: false,
          icon: Icon(
            Icons.visibility,
            color: (systemInf.mostrarPass ? Colors.yellow : Colors.white),
          ),
          padding: EdgeInsets.only(right: 20),
          onPressed: () {
            //oculta/muestra las passwords
            systemInf.mostrarPass = !systemInf.mostrarPass;
            //passOcultas = !passOcultas;
          }, //Agregar pagina de informacion
        )
      ],
      elevation: 0,
      toolbarHeight: 60,
    );
  }
}
