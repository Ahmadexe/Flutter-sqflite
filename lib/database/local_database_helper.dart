import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  
  static const String _dbName = "myDatabase.db";
  static const int _dbVersion = 1;
  static const String _tableName = "myTable";
  static const String _columnId = "id";
  static const String _columnUser = "user";

  // Making class Singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future <Database?> get database async {
    if (_database == null) return _database;
    _database = await _initializeDatabase();
    return _database;
  }

  _initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    db.query(
      '''
      CREATE TABLE $_tableName($_columnId INTEGER PRIMARY KEY AUTOINCREMENT, $_columnUser TEXT NOT NULL)
      '''
    );
  }

}