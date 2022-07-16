import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class Question with _$Question {
  factory Question({
    required String id,
    required String topicId,
    required String sheetId,
    required String title,
    required bool isSolved,
    @Default(false) bool isFavourite,
    String? description,
    String? note,
    String? code,
    String? url,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      topicId: json['topic']['id'],
      sheetId: json['sheet']['id'],
      title: json['title'] as String,
      isSolved: json['isSolved'] as bool,
      isFavourite: json['isFavourite'] as bool? ?? false,
      description: json['description'] as String?,
      note: json['note'] as String?,
      code: json['code'] as String?,
      url: json['url'] as String?,
    );
  }

  // SQL table and column names
  static const tableName = 'table_question';
  static const columnId = 'id';
  static const columnTopicId = 'topicId';
  static const columnSheetId = 'sheetId';
  static const columnTitle = 'title';
  static const columnIsSolved = 'isSolved';
  static const columnIsFavourite = 'isFavourite';
  static const columnDescription = 'description';
  static const columnNote = 'note';
  static const columnCode = 'code';
  static const columnUrl = 'url';
}

// Had to do this or Freezed was giving error
extension QuestionExtension on Question {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic': {'id': topicId},
      'sheet': {'id': sheetId},
      'title': title,
      'isSolved': isSolved,
      'isFavourite': isFavourite,
      'description': description,
      'note': note,
      'code': code,
      'url': url,
    };
  }
}
