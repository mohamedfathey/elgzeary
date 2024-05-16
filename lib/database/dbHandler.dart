// ignore_for_file: constant_identifier_names

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:login_app_project/database/signUp.dart';

class DataBaseHandller {
  static Database? _db;
  static const String DATABASE = "mydata.db";
  static const int VERSION = 1;
  static const String AUTHTENTICATION_TABLE = "authtentication";
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

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $AUTHTENTICATION_TABLE ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $USERNAME TEXT, $PASSWORD TEXT)");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("drop table $AUTHTENTICATION_TABLE");
    await _onCreate(db, newVersion);
  }

  Future<SignUp> signUP(SignUp signUp) async {
    Database dbClient = await db;
    int id = await dbClient.insert(AUTHTENTICATION_TABLE, {
      'id': signUp.id,
      'username': signUp.username,
      'password': signUp.password
    });
    signUp.id = id;
    return signUp;
  }

  // Future<bool> authenticate(SignUp signUp) async {
  //   Database dbClient = await db;
  //   final authenticated = await db.query(AUTHTENTICATION_TABLE,
  //       where: 'username = ? AND password = ?',
  //       whereArgs: [signUp.username, signUp.password]);
  //   if (authenticated.isNotEmpty) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
