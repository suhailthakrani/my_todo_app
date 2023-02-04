import 'package:my_todo_app/models/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  static Database? _database;

  Future<Database?> get dataBase async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'my_todo_app.db'),
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          body TEXT,
          creationDate DATE
        )
      ''');
      },
      version: 1,
    );
  }

  addNewNote(Note note) async {
    final db = await dataBase;

    db!.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<dynamic> getNotes() async {
    final db = await dataBase;
    var res = await db!.query('notes');
    if (res.isEmpty) {
      return null;
    } else {
      var resMap = res.toList();
      return resMap.isNotEmpty ? resMap : null;
    }
  }
}
