import 'package:amnesia/providers/systemInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amnesia/pages/start.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:local_auth_device_credentials/auth_strings.dart';
import 'package:provider/provider.dart';

//----------------- authentication -----------------
//import 'package:local_auth_device_credentials/auth_strings.dart';
//import 'package:local_auth_device_credentials/error_codes.dart';
//import 'package:local_auth_device_credentials/local_auth.dart';
//----------------- authentication -----------------

/* 
Pagina para que luego de autenticar a la persona se proceda a ingresar a Inicio()
Primero implementar para android, utilizando fingerprint y en caso de no tenerlo, usar la
seguridad default de la persona.

Links utiles:
https://blog.codemagic.io/flutter-local-authentication-using-biometrics/
https://pub.dev/packages/local_auth

Implementacion:
Para autenticacion por huella: Tarjeta que diga "Ingrese huella" o algo por el estilo
Para pin o patro: Mostrar Scaffold con el pin o patron input

*/

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  //final LocalAuthentication auth = LocalAuthentication();

  /*@override
  void initState() {
    tieneSeguridad().then((tieneSensor) {
      //print(tiene_sensor);
      tieneSensor
          ? _autenticar().then(
              (entra) {
                entra
                    ? Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Inicio()))
                    : print("No authorizado");
              },
            ) //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          : print("No tiene huella");
      /* Si tiene sensor, autentica al usuario y sino no */
    },);
  }*/

  @override
  Widget build(BuildContext context) {
    final systemInf = Provider.of<SystemInfo>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icon.png"),
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Cargando...",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                SpinKitFadingCube(
                  size: 25,
                  color: Colors.greenAccent,
                ),*/
                TextButton(
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return Inicio();
                      }),
                    );
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      color: systemInf.colorImportante,
                      fontSize: 20,
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

  /*Future<bool> tieneSeguridad() async {
    //Para ver si tiene huella o face id
    bool hasBiometric = false;
    try {
      hasBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    return hasBiometric;
  }

  Future<bool> _autenticar() async {
    bool autenticado = false; //aca va false
    try {
      autenticado = await auth.authenticate(
          localizedReason: "Ingrese autenticación",
          androidAuthStrings: AndroidAuthMessages(
              signInTitle: "Autenticación necesaria",
              biometricRequiredTitle: "Autenticación necesaria",
              biometricHint: "",
              cancelButton: "Cancelar"),
          useErrorDialogs: true,
          sensitiveTransaction: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    return autenticado;
  }*/
}
