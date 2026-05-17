import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AppDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    _database = await _initDatabase();

    return _database!;
  }

  static Future<Database> _initDatabase() async {

    final caminho = join(
      await getDatabasesPath(),
      "playmusic.db",
    );

    print(caminho);

    return await openDatabase(
      caminho,
      version: 1,

      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE music(
        
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        artista TEXT,
        album TEXT,
        genero TEXT,
        humor TEXT,
        duracao REAL,
        nota INTEGER,
        favorita INTEGER
        
        )
        ''');
      },
    );
  }

  static Future<int> inserirMusica(
      Map<String, dynamic> musica,
  ) async {

    final db = await database;

    return await db.insert(
      "music",
      musica,
    );
  }

  static Future<List<Map<String,dynamic>>>
  listarMusicas() async {

    final db = await database;

    return await db.query(
      "music",
      orderBy: "titulo",
    );
  }

  static Future<int> excluirMusica(
      int id,
  ) async {

    final db = await database;

    return await db.delete(
      "music",
      where: "id=?",
      whereArgs:[id],
    );
  }

  static Future<int>
  atualizarMusica(
  Map<String,dynamic> musica,
  ) async {

  final db =
  await database;

  return await db.update(
    "music",
    musica,

    where:"id=?",

    whereArgs:[
      musica['id']
    ],
  );
  }

}