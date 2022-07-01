import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:todo/models/task_model.dart';

class DBHelper {
  static const int _version = 1;
  static const String _tableName = "tasks";
  static Database? _db;

  static Future<void> initDatabase() async {
    if (_db != null) {
      return;
    }
    try {
      final dbPath = await getDatabasesPath();
      String path = '$dbPath tasks.db';

      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new db");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING,"
            "description TEXT,"
            "date STRING, "
            "time STRING,"
            "isDone INTEGER, "
            "color INTEGER"
            ")",
          );
        },
      );
    } catch (error) {
      print('Error to open DB: ${error.toString()}');
    }
  }

  static Future<int> insert(TaskModel task) async {
    return await _db?.insert(_tableName, task.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>?> query() async {
    return await _db?.query(_tableName);
  }
}