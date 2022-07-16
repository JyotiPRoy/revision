import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:revision/api_constants.dart';
import 'package:revision/core/model/question/question.dart';
import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  // Sheet
  @GET(ApiConstants.sheetEndpoint)
  Future<List<Sheet>> getAllSheets();

  @POST(ApiConstants.sheetEndpoint)
  Future<String> addSheet(@Body() Sheet sheet);

  @PUT(ApiConstants.sheetEndpoint)
  Future<Sheet> updateSheet(@Body() Sheet sheet);

  // Topic
  @GET(ApiConstants.subTopicEndpoint)
  Future<List<Topic>> getTopicsBySheet(@Path() String sheetId);

  @POST(ApiConstants.subTopicEndpoint)
  Future<String> addTopicToSheet(@Path() String sheetId, @Body() Topic topic);

  @GET(ApiConstants.topicsEndpoint)
  Future<List<Topic>> getAllTopics();

  @PUT(ApiConstants.topicsWithVarEndpoint)
  Future<Topic> updateTopic(@Path() String topicId, @Body() Topic topic);

  // Questions
  @GET(ApiConstants.questionsEndpoint)
  Future<List<Question>> getAllQuestions();

  @POST(ApiConstants.questionsEndpoint)
  Future<String> addQuestion(@Body() Map<String, dynamic> data);

  @PUT(ApiConstants.questionsWithVarEndpoint)
  Future<Question> updateQuestion(
      @Path() String questionId, @Body() Map<String, dynamic> data);

  @DELETE(ApiConstants.questionsWithVarEndpoint)
  Future<int> deleteQuestion(@Path() String questionId);

  @GET(ApiConstants.topicQuestionsEndpoint)
  Future<List<Question>> getQuestionsByTopic(@Path() String topicId);

  @GET(ApiConstants.sheetQuestionsEndpoint)
  Future<List<Question>> getQuestionsBySheet(@Path() String sheetId);

  @GET(ApiConstants.sheetTopicQuestionsEndpoint)
  Future<List<Question>> getQuestionsBySheetAndTopic(
      @Path() String sheetId, @Path() String topicId);
}
