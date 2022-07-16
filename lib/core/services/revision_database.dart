import 'package:revision/core/model/question/question.dart';
import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';
import 'package:revision/core/sql/question_dao.dart';
import 'package:revision/core/sql/sheet_dao.dart';
import 'package:revision/core/sql/topic_dao.dart';
import 'package:revision/utils/ui_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  DatabaseService._();

  static final DatabaseService _instance = DatabaseService._();
  static DatabaseService get instance => _instance;

  static late Database _db;
  static late SheetDao _sheetDao;
  static late TopicDao _topicDao;
  static late QuestionDao _questionDao;

  Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'revision_database.db'),
      onCreate: (db, version) async {
        _sheetDao = SheetDao(db: db);
        _topicDao = TopicDao(db: db);
        _questionDao = QuestionDao(db: db);

        // has to be in this order, so did not use Future.wait()
        await _sheetDao.createTable();
        await _topicDao.createTable();
        await _questionDao.createTable();
      },
      version: 1,
    );
  }

  // Sheet Operations
  Future<List<Sheet>> getAllSheets() async => _sheetDao.getAllSheets();

  Future<void> addSheet(Sheet sheet) async => _sheetDao.addSheet(sheet);

  Future<void> updateSheet(String sheetId, Sheet newSheet) async {
    if (sheetId == newSheet.id) {
      _sheetDao.addSheet(newSheet);
    } else {
      UiUtils.showError(
        message: 'Error in updateSheet! Reason: sheetId does not match newSheet.id',
      );
    }
  }

  // Topic Operations
  Future<List<Topic>> getAllTopics() async => _topicDao.getAllTopics();

  Future<List<Topic>> getTopicsBySheet(String sheetId) async =>
      _topicDao.getTopicsBySheet(sheetId);

  Future<void> addTopicToSheet(String sheetId, Topic topic) async =>
    _topicDao.addTopicToSheet(sheetId, topic);

  Future<void> updateTopicName(String topicId, String newName) async =>
    _topicDao.updateTopicName(topicId, newName);

  // Question Operations
  Future<List<Question>> getQuestionsByTopic(String topicId) async =>
    _questionDao.getQuestionsByTopic(topicId);

  Future<List<Question>> getQuestionBySheetAndTopic(String sheetId, String topicId) async =>
    _questionDao.getQuestionBySheetAndTopic(sheetId, topicId);

  Future<void> addQuestion(Question question) async =>
    _questionDao.addQuestion(question);

  Future<void> updateQuestion(Question question) async =>
    _questionDao.updateQuestion(question);

  Future<void> deleteQuestion(String questionId) async =>
    _questionDao.deleteQuestion(questionId);
}
