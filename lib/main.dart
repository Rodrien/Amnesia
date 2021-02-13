import 'package:flutter/material.dart';
import 'package:amnesia/pages/inicio.dart';
//----------------- authentication -----------------
//import 'package:local_auth_device_credentials/auth_strings.dart';
//import 'package:local_auth_device_credentials/error_codes.dart';
//import 'package:local_auth_device_credentials/local_auth.dart';
//----------------- authentication -----------------

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amnesia',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Inicio(),
    );
  }
}
