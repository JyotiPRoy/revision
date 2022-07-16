import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet.freezed.dart';
part 'sheet.g.dart';

@freezed
class Sheet with _$Sheet {
  factory Sheet({
    required String id,
    required String title,
  }) = _Sheet;

  factory Sheet.fromJson(Map<String, dynamic> json) => _$SheetFromJson(json);

  //SQL table and column names
  static const tableName = 'table_sheet';
  static const columnId = 'id';
  static const columnTitle = 'title';
}
