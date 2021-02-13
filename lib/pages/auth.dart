import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}
