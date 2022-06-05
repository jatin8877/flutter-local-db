import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:working_with_local_database/models/dictonary.dart';
// import 'package:working_with_local_database/models/note.dart';

class DiaryDatabase {
  static final DiaryDatabase instance = DiaryDatabase._init();
  DiaryDatabase._init();

  static Database? _database2;

  Future<Database> get database async {
    if (_database2 != null) return _database2!;
    _database2 = await _initializeDB('diary.db');
    return _database2!;
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    // const boolType = 'BOOLEAN NOT NULL';
    // const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $diaryName(
${DetailFields.id} $idType,
${DetailFields.userName} $textType,
${DetailFields.password} $textType
)
''');
  }

  Future<Details> registerUser(Details details) async {
    final db = await instance.database;
    // var result = await isUserExistes(details.userName);
    // if (result == false) {
    //   throw Exception('Username Already Exists');
    // }
    final id = await db.insert(diaryName, details.toJson());
    return details.copy(id: id);
    // return true;
  }

  Future<bool> isUserExistes(String username) async {
    final db = await instance.database;
    final maps = await db.query(
      diaryName,
      columns: DetailFields.values,
      where: '${DetailFields.userName} = ?',
      whereArgs: [username],
    );
    if (maps.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> validateUser(String username, String password) async {
    final db = await instance.database;
    final maps = await db.query(
      diaryName,
      columns: DetailFields.values,
      where: '${DetailFields.userName} = ? and ${DetailFields.password} = ?',
      whereArgs: [username, password],
    );
    if (maps.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
