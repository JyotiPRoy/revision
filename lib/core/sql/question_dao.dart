import 'package:revision/core/model/question/question.dart';
import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';
import 'package:sqflite/sqflite.dart';

class QuestionDao {
  final Database db;

  QuestionDao({required this.db});

  Future<void> createTable() async {
    return db.execute('''
      create table ${Question.tableName} (
        ${Question.columnId} text primary key,
        ${Question.columnTopicId} text not null,
        ${Question.columnSheetId} text not null,
        ${Question.columnTitle} text not null,
        ${Question.columnIsSolved} integer not null,
        ${Question.columnIsFavourite} integer not null,
        ${Question.columnDescription} text,
        ${Question.columnNote} text,
        ${Question.columnCode} text,
        ${Question.columnUrl} text,
        foreign key (${Question.columnTopicId}) references ${Topic.tableName}(${Topic.columnId}),
        foreign key (${Question.columnSheetId}) references ${Sheet.tableName}(${Sheet.columnId})
      )  
    ''');
  }

  List<Question> _processRawQuestion(List<Map<String, Object?>> rawQuestions) {
    int isSolved, isFavourite;
    return rawQuestions.map((json) {
      isSolved = json[Question.columnIsSolved] as int;
      isFavourite = json[Question.columnIsFavourite] as int;

      json[Question.columnIsSolved] = isSolved == 1;
      json[Question.columnIsFavourite] = isFavourite == 1;

      return Question.fromJson(json);
    }).toList();
  }

  Future<List<Question>> getQuestionsByTopic(String topicId) async {
    final rawQuestions = await db.query(Question.tableName,
        where: "${Question.columnTopicId} = ?",
        whereArgs: [topicId],
        orderBy: "${Question.columnId} asc");

    return _processRawQuestion(rawQuestions);
  }

  Future<List<Question>> getQuestionBySheetAndTopic(
      String sheetId, String topicId) async {
    final rawQuestions = await db.query(Question.tableName,
        where:
            "${Question.columnTopicId} = ? and ${Question.columnSheetId} = ?",
        whereArgs: [topicId, sheetId],
        orderBy: "${Question.columnId} asc");

    return _processRawQuestion(rawQuestions);
  }

  Future<void> addQuestion(Question question) async {
    final json = question.toJson();

    json[Question.columnIsSolved] = question.isSolved ? 1 : 0;
    json[Question.columnIsFavourite] = question.isFavourite ? 1 : 0;

    await db.insert(
      Question.tableName,
      json,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateQuestion(Question question) async {
    return addQuestion(question);
  }

  Future<void> deleteQuestion(String questionId) async {
    await db.delete(
      Question.tableName,
      where: "${Question.columnId} = ?",
      whereArgs: [questionId],
    );
  }
}
