import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  factory Topic({
    required String id,
    required String title,
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  // SQL table and column names
  static const tableName = 'table_topic';
  static const columnId = 'id';
  static const columnTitle = 'title';

  // mapping table b/w sheet and topics
  static const mappingTableName = 'table_map_sheet_topic';
  static const mColumnId = 'id';
  static const mColumnSheetId = 'sheetId';
  static const mColumnTopicId = 'topicId';
}
