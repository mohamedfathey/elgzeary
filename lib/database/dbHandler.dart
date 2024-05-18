// ignore_for_file: constant_identifier_names

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHandler {
  static Database? _db;
  static const String DATABASE = "mydata.db";
  static const int VERSION = 1;
  static const String AUTHENTICATION_TABLE = "authentication";
  static const String ID = "id";
  static const String USERNAME = "username";
  static const String PASSWORD = "password";

  Future<Database> get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), DATABASE);
      _db = await openDatabase(path,
          version: VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
    return _db!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $AUTHENTICATION_TABLE ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $USERNAME TEXT, $PASSWORD TEXT)");
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("DROP TABLE IF EXISTS $AUTHENTICATION_TABLE");
    await _onCreate(db, newVersion);
  }

  Future<int> signUp(String username, String password) async {
    Database dbClient = await db;
    int id = await dbClient
        .insert(AUTHENTICATION_TABLE, {USERNAME: username, PASSWORD: password});

    return id;
  }

  Future<bool> login(String username, String password) async {
    Database dbClient = await db;
    List<Map> result = await dbClient.query(AUTHENTICATION_TABLE,
        where: '$USERNAME = ? AND $PASSWORD = ?',
        whereArgs: [username, password]);
    // print(result[0].toString());
    return result.isNotEmpty;
  }
}
