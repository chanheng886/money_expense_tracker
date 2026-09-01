import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initianDatabase();

    return _database!;
  }

  static Future<Database> _initianDatabase() async {
    final path = join(await getDatabasesPath(), 'expense_tracker.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        await db.execute(''' 
        CREATE TABLE transactions (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          note TEXT NOT NULL,
          amount REAL NOT NULL,
          type TEXT NOT NULL,
          date TEXT NOT NULL
        )
      ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            "ALTER TABLE transactions ADD COLUMN type TEXT NOT NULL DEFAULT ''",
          );
        }
      },
    );
  }
}
