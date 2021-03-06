import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:amnesia/widgets/SocialRow.dart';
import 'package:amnesia/lista.dart';
import 'package:amnesia/pages/addScreen.dart';
import 'package:amnesia/widgets/CustomDrawer.dart';
import 'package:amnesia/widgets/CustomAppBar.dart';
import 'package:provider/provider.dart';

//-------------- Variables --------------
List<String> genericos = [
  "Logo",
  "Estrella",
  "Mail",
  "Banco",
  "Juegos",
];
List<String> especificos = [
  "LinkedIn",
  "Windows",
  "Spotify",
  "MercadoLibre",
  "Prex",
  "MercadoPago",
  "Apple",
  "Github",
  "PedidosYa",
  "Pinterest",
  "Skype",
  "Google",
  "Facebook",
  "Instagram",
  "Twitter",
  "BROU",
  "Uber",
  "Netflix",
  "Outlook",
  "PayPal",
  "BPS",
]..sort(); //Ordena en orden alfabetico

List<String> plataFormas = genericos + especificos;
//-------------- Variables --------------

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        drawerScrimColor: Color.fromRGBO(40, 40, 40, 0.5),
        appBar: CustomAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SocialRow(),
            Expanded(
              child: Lista(),
            ),
          ],
        ),
        backgroundColor: systemInf.colorFondoPrincipal,
        floatingActionButton: FloatingActionButton(
          backgroundColor: systemInf.colorFondoPrincipal,
          child: Icon(
            Icons.add_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            pantallaAgregar();
            //setState(() {});
          },
        ),
      ),
    );
  }

  void pantallaAgregar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return PaginaAgregar();
      }),
    );
  }
}
