import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart'; //SQLite DB

import 'package:amnesia/model/entrada.dart';

class LocalDatabase with ChangeNotifier {
  LocalDatabase();

  static const databaseName = "amnesia_database.db";
  //static final LocalDatabase instance = LocalDatabase._();
  static Database _database;

  Future<Database> get database async {
    //singleton
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database;
  }

  initializeDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE entradas(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, user TEXT, password TEXT,plataForma TEXT, favorito INTEGER)");
        await db.execute(
            "CREATE TABLE systemInfo(id INTEGER PRIMARY KEY, name TEXT,value TEXT)");
        await db
            .execute("INSERT INTO systemInfo VALUES (0,'firstBoot','True')");
      },
    );
  }

  Future<String> retrieveFirstBoot() async {
    final db = await database;

    var dbQuery = await db
        .rawQuery('SELECT value FROM systemInfo WHERE name=?', ['firstBoot']);
    if (dbQuery.length > 0) {
      String ret = dbQuery.first.values.first.toString();
      return ret;
    } else {
      return "False";
    }
  }

  Future<void> updateFirstBoot() async {
    final db = await database;

    var map = Map<String, dynamic>();
    map['id'] = 0;
    map['value'] = "False";

    await db.update("systemInfo", map,
        where: "id = ?",
        whereArgs: [0],
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<String> retrieveMasterPassword() async {
    //redo like boot method
    final db = await database;

    var dbQuery =
        await db.rawQuery('SELECT value FROM systemInfo WHERE id=?', [1]);
    if (dbQuery.length > 0) {
      String ret = dbQuery.first.values.first.toString();
      return ret;
    } else {
      return "Error";
    }
  }

  Future<void> insertMasterPassword(String pass) async {
    final db = await database;

    var map = Map<String, dynamic>();
    map['id'] = 1;
    map['name'] = 'masterPassword';
    map['value'] = pass;

    await db.insert("systemInfo", map, //insertamos en la tabla "masterPassword"
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<List<Entrada>> retrieveEntradas() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query("entradas");

    return List.generate(
      maps.length,
      (i) {
        return Entrada(
          id: maps[i]["id"],
          titulo: maps[i]["titulo"],
          usuario: maps[i]["user"],
          password: maps[i]["password"],
          plataForma: maps[i]["plataForma"],
          favorito: maps[i]["favorito"],
        );
      },
    );
  }

  Future<void> insertEntrada(Entrada entrada) async {
    final db = await database;
    await db.insert(
        "entradas", entrada.toMap(), //insertamos en la tabla "entradas"
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<void> deleteEntrada(int id) async {
    var db = await database;
    db.delete("entradas", where: 'id = ?', whereArgs: [id]);
    notifyListeners();
  }

  Future<void> updateEntrada(Entrada entrada) async {
    final db = await database;

    await db.update("entradas", entrada.toMap(),
        where: "id = ?",
        whereArgs: [entrada.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    notifyListeners();
  }

  Future<void> favEntrada(int id, int fav) async {
    final db = await database;

    await db.execute("UPDATE entradas SET favorito = $fav WHERE id = $id");

    notifyListeners();
  }
}
