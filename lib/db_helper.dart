import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'soal.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE soal (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            question TEXT,
            optionA TEXT,
            optionB TEXT,
            optionC TEXT,
            answer TEXT,
            level TEXT
          )
        ''');
      },
    );
  }

  /// CREATE
  Future<int> insertSoal(Map<String, dynamic> data) async {
    final client = await db;
    return client.insert('soal', data);
  }

  /// READ
  Future<List<Map<String, dynamic>>> getSoal() async {
    final client = await db;
    return client.query('soal', orderBy: 'id DESC');
  }

  /// UPDATE
  Future<int> updateSoal(int id, Map<String, dynamic> data) async {
    final client = await db;
    return client.update('soal', data, where: 'id = ?', whereArgs: [id]);
  }

  /// DELETE
  Future<int> deleteSoal(int id) async {
    final client = await db;
    return client.delete('soal', where: 'id = ?', whereArgs: [id]);
  }
}
