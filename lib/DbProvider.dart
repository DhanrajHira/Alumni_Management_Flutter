import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import './models/student.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await intializedatabase();
    return _database;
  }

  Future intializedatabase() async {
    Directory documentsdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsdirectory.path, 'AlumniData.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          '''CREATE TABLE Alumni (Alu_ID INTEGER PRIMARY KEY AUTOINCREMENT, First_name VARCHAR(25),
           Last_name VARCHAR(30), DOB DATE, Gender VARCHAR(10), Correspondance_Address VARCHAR(50),
            Office_Address VARCHAR(50), EmailID VARCHAR(50), Mobile_No VARCHAR(10),
             Current_city VARCHAR(30), Current_company VARCHAR(30), Designation VARCHAR(20),
              Session_from YEAR(4), Session_to YEAR(4), Branch VARCHAR(30))''');
    });
  }

  void addrecord(Student student) async {
    final db = await database;
    db.insert('Alumni', student.toMap());
  }

  Future<List<Student>> getallrecords() async {
    final db = await database;
    final res = await db.query('Alumni');
    List resformated = res.map((datamap) {
      return Student.frommap(datamap);
    }).toList();
    return resformated;
  }

  void updaterecord(Student student) async {
    final db = await database;
    db.update('Alumni', student.toMap(),
        where: 'Alu_ID = ?', whereArgs: [student.aluid]);
    //db.execute('UPDATE Alumni SET ')
  }

  void deleterecord(String idToDelete) async {
    final db = await database;
    db.delete('Alumni', where: 'Alu_ID = ?', whereArgs: [idToDelete]);
    //db.execute('delete from Alumni where Alu_ID = $idToDelete');
  }

  void cleardatabase() async {
    final db = await database;
    db.execute('DROP TABLE Alumni');
    db.execute(
        '''CREATE TABLE Alumni (Alu_ID INTEGER PRIMARY KEY AUTOINCREMENT, First_name VARCHAR(25),
         Last_name VARCHAR(30), DOB DATE, Gender VARCHAR(10), Correspondance_Address VARCHAR(50),
          Office_Address VARCHAR(50), EmailID VARCHAR(50), Mobile_No VARCHAR(10), Current_city VARCHAR(30),
           Current_company VARCHAR(30), Designation VARCHAR(20), Session_from YEAR(4), Session_to YEAR(4),
            Branch VARCHAR(30))''');
  }

  Future<List<Student>> searchdatabase(
      String searchfieldname, String searchvalue) async {
    final db = await database;
    List result = await db.query('Alumni',
        columns: Student.fieldnames,
        where: '$searchfieldname=?',
        whereArgs: ['$searchvalue']);
    List<Student> resultformanted = result.map((datamap) {
      return Student.frommap(datamap);
    }).toList();
    return resultformanted;
  }
}
