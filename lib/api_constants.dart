import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final baseUrl = dotenv.get('API_BASE_URL');

  static const ping = '/ping';
  static const sheetEndpoint = '/sheet';

  static const subTopicEndpoint = '/sheet/{sheetId}/topics';
  static const topicsEndpoint = '/topics';
  static const topicsWithVarEndpoint = '/topics/{topicId}';

  static const questionsEndpoint = '/questions';
  static const questionsWithVarEndpoint = '/questions/{questionId}';
  static const topicQuestionsEndpoint = '/topic/{topicId}/questions';
  static const sheetQuestionsEndpoint = '/sheet/{sheetId}/questions';
  static const sheetTopicQuestionsEndpoint = '/sheet/{sheetId}/topic/{topicId}/questions';
}