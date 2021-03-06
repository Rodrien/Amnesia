import 'package:amnesia/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amnesia/providers/systemInfo.dart';
import 'package:amnesia/providers/localDatabase.dart';
import 'package:amnesia/pages/welcome.dart';
import 'package:amnesia/utils/userPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
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
    final dataBase = Provider.of<LocalDatabase>(context);
    final systemInf = Provider.of<SystemInfo>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Amnesia',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: dataBase.retrieveFirstBoot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            systemInf.init();
            //print(snapshot.data.toString());
            if (snapshot.data.toString() == "True") {
              return Welcome();
            } else {
              return Auth();
            }
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
