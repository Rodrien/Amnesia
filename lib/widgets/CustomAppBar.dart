import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amnesia/providers/systemInfo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);

    return AppBar(
      backgroundColor: systemInf.colorFondoPrincipal,
      centerTitle: true,
      title: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Am",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(
                    255, 230, 221, 59), //Color.fromARGB(255, 37, 211, 102),
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
            color: (systemInf.mostrarPass
                ? Color.fromARGB(255, 230, 221, 59)
                : Colors.white),
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
