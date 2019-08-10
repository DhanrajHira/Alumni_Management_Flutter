import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import './models/alumni.dart';

class DBProvider with ChangeNotifier {
  Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initdatabase();
      return _database;
    }
  }

  Future<Database> initdatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'Alumni.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          '''CREATE TABLE Alumni (Alu_ID INTEGER PRIMARY KEY AUTOINCREMENT, First_name VARCHAR(25),
           Last_name VARCHAR(30), DOB DATE, Gender VARCHAR(10), Correspondance_Address VARCHAR(50),
            Office_Address VARCHAR(50), EmailID VARCHAR(50), Mobile_No VARCHAR(10),
             Current_city VARCHAR(30), Current_company VARCHAR(30), Designation VARCHAR(20),
              Session_from YEAR(4), Session_to YEAR(4), Branch VARCHAR(30))''');
    });
  }

  void addrecord(Alumni alumni) async {
    final db = await database;
    db.insert('Alumni', alumni.toMap());
  }

  Future<List> getallrecords() async {
    final db = await database;
    List result = await db.query('Alumni');
    List<Alumni> formated = result.map((map) => Alumni.frommap(map)).toList();
    return formated;
  }

  void updaterecord(Alumni alumni) async {
    final db = await database;
    db.update('Alumni', alumni.toMap(),
        where: 'Alu_ID = ?', whereArgs: [alumni.aluid]);
  }

  void deleterecord(Alumni alumni) async {
    final db = await database;
    db.delete('Alumni', where: 'Alu_ID = ?', whereArgs: [alumni.aluid]);
  }

  Future<List<Alumni>> searchrecords(
      {String searchby, String searchvalue}) async {
    final db = await database;
    List<Map> results = await db.query('Alumni',
        columns: Alumni.fieldnames,
        where: '$searchby=?',
        whereArgs: ['$searchvalue']);
    List<Alumni> formatedresults =
        results.map((datamap) => Alumni.frommap(datamap)).toList();
    return formatedresults;
  }
}
