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
              child: Text("aux"),
            ),
            Expanded(
              child: Container(
                //aca un listview cion opciones
                color: systemInf.colorCajonPasswords,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 0,
                        bottom: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ListTile(
                          leading: Icon(
                            Icons.create_rounded,
                            color: Colors.white,
                          ),
                          tileColor: systemInf.colorFondoPrincipal,
                          title: Text(
                            "Generador de contraseñas",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {},
                          selectedTileColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ListTile(
                          leading: Icon(
                            Icons.import_export_rounded,
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          tileColor: systemInf.colorFondoPrincipal,
                          title: Text(
                            "Importar/Exportar",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {},
                          selectedTileColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          tileColor: systemInf.colorFondoPrincipal,
                          title: Text(
                            "Configuracion",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {},
                          selectedTileColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ListTile(
                          leading: Icon(
                            Icons.contact_support_rounded,
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          tileColor: systemInf.colorFondoPrincipal,
                          title: Text(
                            "Contacto",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {},
                          selectedTileColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 0),
              padding: EdgeInsets.only(
                top: 0,
                bottom: 0,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.lightbulb_outline_rounded,
                  color: Colors.white,
                ),
                onPressed: () {}, //open bottom drawer to change theme
              ),
            ),
          ],
        ),
      ),
    );
  }
}
