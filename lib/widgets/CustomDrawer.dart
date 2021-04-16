import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return Drawer(
      child: Container(
        color: systemInf.colorFondoPrincipal,
        child: Column(
          children: [
            Container(
              color: systemInf.colorFondoPrincipal,
              height: 150,
            ),
            Expanded(
              child: Container(
                //aca un listview cion opciones
                color: systemInf.colorCajonPasswords,
              ),
            ),
            Container(
              color: systemInf.colorFondoPrincipal,
              height: 20,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Creado por",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                      ),
                    ),
                    TextSpan(
                      text: " Kike Dev",
                      style: TextStyle(
                        fontSize: 14,
                        color: systemInf.colorImportante,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
