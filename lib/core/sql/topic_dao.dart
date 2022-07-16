import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';
import 'package:sqflite/sqflite.dart';

class TopicDao {
  final Database db;

  TopicDao({required this.db});

  Future<void> createTable() async {
    await db.execute('''
      create table ${Topic.tableName} (
        ${Topic.columnId} text primary key,
        ${Topic.columnTitle} text not null
      )  
    ''');
    return db.execute('''
      create table ${Topic.mappingTableName} (
        ${Topic.mColumnId} integer primary key autoincrement not null,
        ${Topic.mColumnSheetId} text not null,
        ${Topic.mColumnTopicId} text not null,
        foreign key (${Topic.mColumnSheetId}) references ${Sheet.tableName}(${Sheet.columnId}),
        foreign key (${Topic.mColumnTopicId}) references ${Topic.tableName}(${Topic.columnId})
      )  
    ''');
  }

  Future<List<Topic>> getAllTopics() async {
    final rawTopics = await db.query(Topic.tableName);
    return rawTopics.map((e) => Topic.fromJson(e)).toList();
  }

  Future<List<Topic>> getTopicsBySheet(String sheetId) async {
    final rawTopics = await db.rawQuery('''
      select * from ${Topic.mappingTableName}
      join ${Topic.tableName} tt on tt.${Topic.columnId} = ${Topic.mappingTableName}.${Topic.mColumnTopicId}
      where ${Topic.mColumnSheetId} = $sheetId;
    ''');

    return rawTopics.map((e) => Topic.fromJson(e)).toList();
  }

  Future<void> addTopicToSheet(String sheetId, Topic topic) async {
    await db.insert(
      Topic.tableName,
      topic.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.rawInsert("""
      insert into ${Topic.mappingTableName} (${Topic.mColumnSheetId}, ${Topic.mColumnTopicId})
      values('$sheetId', '${topic.id}');
    """);
  }

  Future<void> updateTopicName(String topicId, String newName) async {
    await db.rawUpdate("""
      update ${Topic.tableName}
      set ${Topic.columnTitle} = '$newName'
      where ${Topic.columnId} = '$topicId';
    """);
  }
}
