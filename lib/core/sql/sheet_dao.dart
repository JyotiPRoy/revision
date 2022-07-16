import 'package:revision/core/model/sheet/sheet.dart';
import 'package:sqflite/sqlite_api.dart';

class SheetDao {
  final Database db;

  SheetDao({required this.db});

  Future<void> createTable() async {
    return db.execute('''
      create table ${Sheet.tableName} (
        ${Sheet.columnId} text primary key,
        ${Sheet.columnTitle} text not null,
      )
    ''');
  }

  Future<List<Sheet>> getAllSheets() async {
    final rawSheets = await db.query(Sheet.tableName);
    return rawSheets.map((e) => Sheet.fromJson(e)).toList();
  }

  Future<void> addSheet(Sheet sheet) async {
    await db.insert(
      Sheet.tableName,
      sheet.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
