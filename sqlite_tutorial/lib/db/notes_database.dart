import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_tutorial/model/item.dart';
import 'package:sqlite_tutorial/model/order.dart';

class MyDatabase {
  static final MyDatabase instance = MyDatabase._init();

  static Database? _database;

  MyDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('MyDataBase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    //const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE ${Order.tableName} (
  ${Order.fieldId} $idType,
  ${Order.fieldSource} $textType,
  ${Order.fieldDestination} $textType
  )
''');

    await db.execute('''
CREATE TABLE ${Item.tableName} (
   ${Item.fieldId} $idType,
   ${Item.fieldItemName} $textType,
   ${Item.fieldOrderId} $integerType
 )
''');
  }



  Future<dynamic> create(String tableName, dynamic object) async {
    final db = await instance.database;

    try{
      final id = await db.insert(tableName, object.toJson());
      // ignore: avoid_print
      print('1 row inserted to $tableName');
      return object.copy(id: id);
    } catch (e) {
      throw Exception('Tables not found');
    }
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}














// Future<dynamic> read(String tableName, int id, List<String> columns) async {
//   final db = await instance.database;
//
//   final maps = await db.query(
//     tableName,
//     columns: columns,
//     where: '${columns[0]} = ?',
//     whereArgs: [id],
//   );
//
//   if (maps.isNotEmpty) {
//     return maps;
//   } else {
//     throw Exception('ID $id not found');
//   }
// }
//
// Future<List<dynamic>> readAll(String tableName) async {
//   final db = await instance.database;
//
//   final result = await db.query(tableName);
//
//   return result;
// }

// Future<List<dynamic>> readAll(String tableName) async {
//   final db = await database;
//
//   final result = await db.query(tableName);
//
//   return result.map((json) => Order.fromJson(json)).toList();
// }

// Future<int> update(dynamic object) async {
//   final db = await database;
//
//   return db.update(
//     object.tableName,
//     object.toJson(),
//     where: '${object.fieldId} = ?',
//     whereArgs: [object.id],
//   );
// }
//
// Future<int> delete(int id, String tableName) async {
//   final db = await database;
//
//   return await db.delete(
//     tableName,
//     where: '${NoteFields.id} = ?',
//     whereArgs: [id],
//   );
// }