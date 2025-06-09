import 'package:bayuppkd_b_2/Tugas_11&12/Model11.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperSebelas {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'pengunjung.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pengunjung(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, email TEXT, tiket INTEGER, asal TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertPengunjung(Pengunjung pengunjung) async {
    final db = await DBHelperSebelas.db();
    await db.insert(
      'pengunjung',
      pengunjung.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Pengunjung>> getAllPengunjung() async {
    final db = await DBHelperSebelas.db();
    final List<Map<String, dynamic>> maps = await db.query('pengunjung');

    return List.generate(maps.length, (i) => Pengunjung.fromMap(maps[i]));
  }

  static Future<void> updatePengunjung(Pengunjung pengunjung) async {
    // update
    final db = await DBHelperSebelas.db();
    await db.update(
      'pengunjung',
      pengunjung.toMap(),
      where: 'id = ?',
      whereArgs: [pengunjung.id],
    );
  }

  static Future<void> deletePengunjung(int id) async {
    //delete
    final db = await DBHelperSebelas.db();
    await db.delete('pengunjung', where: 'id = ?', whereArgs: [id]);

    // Cek apakah tabel kosong, lalu reset auto increment
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM pengunjung'),
    );
    if (count == 0) {
      await db.execute("DELETE FROM sqlite_sequence WHERE name = 'pengunjung'");
    }
  }
}
