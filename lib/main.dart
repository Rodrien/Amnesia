import 'package:amnesia/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:amnesia/pages/mainScreen.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:amnesia/providers/localDatabase.dart';
//import 'package:amnesia/pages/auth.dart';
import 'package:amnesia/pages/welcome.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SystemInfo>(
          create: (_) => SystemInfo(),
        ),
        ChangeNotifierProvider<LocalDatabase>(
          create: (_) => LocalDatabase(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, //poner en false para produccion
      title: 'Amnesia',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Welcome(), //SelectFirstPage();
    );
  }
}

Widget SelectFirstPage() {
  return Container();
}
