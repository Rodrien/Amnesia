import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'mainScreen.dart';
import 'package:amnesia/pages/initialSetup.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Container(
            color: systemInf.colorFondoPrincipal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage('assets/icon.png'),
                  radius: 100,
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  "¡Bienvenidos a Amnesia!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  """Nuestro objetivo es almacenar y recordarle sus contraseñas de una manera
segura y eficaz.
Para comenzar establezcamos su contraseña maestra.""",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 70,
                          right: 70,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          systemInf.colorFondoPasswords)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Setup()),
                        (route) => false);
                  },
                  child: Text(
                    "Comenzar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
