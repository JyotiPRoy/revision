import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:revision/core/model/question/question.dart';
import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';
import 'package:revision/core/services/api_service.dart';
import 'package:revision/store/future_store.dart';
import 'package:revision/utils/ui_utils.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final ApiService _apiService = GetIt.I<ApiService>();

  @observable
  int currentPage = 0;

  @observable
  FutureStore<bool> addFuture = FutureStore();

  @observable
  FutureStore<List<Sheet>> sheetsFuture = FutureStore();

  @observable
  FutureStore<List<Topic>> topicsFuture = FutureStore();

  @observable
  FutureStore<List<Question>> questionsFuture = FutureStore();

  @observable
  FutureStore<bool> editFuture = FutureStore();

  @observable
  ObservableList<Sheet> sheets = ObservableList();

  @observable
  ObservableList<Topic> topics = ObservableList();

  @observable
  ObservableMap<String, List<Topic>> topicsBySheet =
      ObservableMap.linkedHashMapFrom({});

  @observable
  ObservableList<String> questionIds = ObservableList();

  @observable
  ObservableMap<String, List<String>> questionIdsByCategory =
      ObservableMap.linkedHashMapFrom({});

  @observable
  ObservableMap<String, Question> questions =
      ObservableMap.linkedHashMapFrom({});

  @action
  void changePage(int newPage) {
    if (newPage != currentPage) {
      currentPage = newPage;
    }
  }

  @action
  Future<void> fetchAllSheets() async {
    try {
      // TODO: Will have to add pull-to-refresh feature for this.
      if (sheets.isEmpty) {
        sheetsFuture.future = ObservableFuture(_apiService.getAllSheets());
        sheets = ObservableList.of(await sheetsFuture.future ?? []);
      }
    } catch (e) {
      UiUtils.showError(
        message: "Error in getAllSheets(), Reason: ${e.toString()}",
      );
    }
  }

  @action
  Future<bool> addSheet({required Sheet sheet, List<Topic>? topics}) async {
    try {
      final sheetId = await _apiService.addSheet(sheet);
      if (sheetId.isNotEmpty) {
        final topicFutures = <Future>[];
        if (topics != null) {
          topics.forEach((topic) {
            topicFutures.add(_apiService.addTopicToSheet(sheet.id, topic));
          });
          await Future.wait(topicFutures);
        }

        fetchAllSheets();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      UiUtils.showError(
        message: "Error in getAllSheets(), Reason: ${e.toString()}",
      );
      return false;
    }
  }

  @action
  Future<void> fetchAllTopics() async {
    try {
      if (topics.isEmpty) {
        topicsFuture.future = ObservableFuture(_apiService.getAllTopics());
        topics = ObservableList.of(await topicsFuture.future ?? []);
      }
    } catch (e) {
      UiUtils.showError(
        message: "Error in fetchAllTopics(), Reason: ${e.toString()}",
      );
    }
  }

  @action
  Future<void> fetchTopicsBySheet(String sheetId) async {
    try {
      if (!topicsBySheet.containsKey(sheetId)) {
        topicsFuture.future =
            ObservableFuture(_apiService.getTopicsBySheet(sheetId));
        final topicsList = await topicsFuture.future;
        if (topicsList != null) {
          topicsBySheet[sheetId] = topicsList;
        }
      }
    } catch (e) {
      UiUtils.showError(
        message: 'Error in getTopicsBySheet(), Reason: ${e.toString()}',
      );
    }
  }

  @action
  Future<void> fetchAllQuestions() async {
    try {
      if (questionIds.isEmpty) {
        questionsFuture.future =
            ObservableFuture(_apiService.getAllQuestions());

        final questionsListResponse = await questionsFuture.future ?? [];
        final questionsMap = <String, Question>{};
        final questionsList = <String>[];

        for (final question in questionsListResponse) {
          questionsList.add(question.id);
          questionsMap[question.id] = question;
        }

        questions = ObservableMap.linkedHashMapFrom(questionsMap);
        questionIds = ObservableList.of(questionsList);
      }
    } catch (e) {
      UiUtils.showError(
        message: "Error in fetchAllQuestions(), Reason: ${e.toString()}",
      );
    }
  }

  @action
  Future<void> fetchQuestionsByTopic(String topicId) async {
    try {
      if (!questionIdsByCategory.containsKey(topicId)) {
        questionsFuture.future =
            ObservableFuture(_apiService.getQuestionsByTopic(topicId));
        final questionsList = await questionsFuture.future;

        if (questionsList != null) {
          final qIdList = <String>[];
          final qMap = questions.cast<String, Question>();

          for (final question in questionsList) {
            qIdList.add(question.id);
            qMap[question.id] = question;
          }

          questionIdsByCategory[topicId] = qIdList;
          questions = ObservableMap.linkedHashMapFrom(qMap);
        }
      }
    } catch (e) {
      UiUtils.showError(
        message: "Error in fetchQuestionsByTopic(), Reason: ${e.toString()}",
      );
    }
  }

  @action
  Future<Question> updateQuestion(Question question) async {
    try {
      final update =
          await _apiService.updateQuestion(question.id, question.toJson());

      questions[question.id] = update;

      return update;
    } catch (e) {
      UiUtils.showError(
        message: "Error in saveQuestion(), Reason: ${e.toString()}",
      );
      return question;
    }
  }
}
