// import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Import sqflite_common_ffi

import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static late DatabaseFactory databaseFactory; // Declare late DatabaseFactory

  DatabaseHelper._privateConstructor() {
    databaseFactory = databaseFactoryFfi; // Initialize databaseFactory
  }

  Future<Database> get database async {
    final String path = join(await getDatabasesPath(), 'user_database.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    print("the user is added done ********************************************************************************************************************************************************************************************");
    Database db = await instance.database;
    print("the user is added done ********************************************************************************************************************************************************************************************");
    return await db.insert('users', user);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await instance.database;
    return await db.query('users');
  }

  Future<bool> userExists(String email, String password) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

}
