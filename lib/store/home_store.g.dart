// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$currentPageAtom =
      Atom(name: '_HomeStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$sheetsFutureAtom =
      Atom(name: '_HomeStore.sheetsFuture', context: context);

  @override
  FutureStore<List<Sheet>> get sheetsFuture {
    _$sheetsFutureAtom.reportRead();
    return super.sheetsFuture;
  }

  @override
  set sheetsFuture(FutureStore<List<Sheet>> value) {
    _$sheetsFutureAtom.reportWrite(value, super.sheetsFuture, () {
      super.sheetsFuture = value;
    });
  }

  late final _$topicsFutureAtom =
      Atom(name: '_HomeStore.topicsFuture', context: context);

  @override
  FutureStore<List<Topic>> get topicsFuture {
    _$topicsFutureAtom.reportRead();
    return super.topicsFuture;
  }

  @override
  set topicsFuture(FutureStore<List<Topic>> value) {
    _$topicsFutureAtom.reportWrite(value, super.topicsFuture, () {
      super.topicsFuture = value;
    });
  }

  late final _$questionsFutureAtom =
      Atom(name: '_HomeStore.questionsFuture', context: context);

  @override
  FutureStore<List<Question>> get questionsFuture {
    _$questionsFutureAtom.reportRead();
    return super.questionsFuture;
  }

  @override
  set questionsFuture(FutureStore<List<Question>> value) {
    _$questionsFutureAtom.reportWrite(value, super.questionsFuture, () {
      super.questionsFuture = value;
    });
  }

  late final _$editFutureAtom =
      Atom(name: '_HomeStore.editFuture', context: context);

  @override
  FutureStore<bool> get editFuture {
    _$editFutureAtom.reportRead();
    return super.editFuture;
  }

  @override
  set editFuture(FutureStore<bool> value) {
    _$editFutureAtom.reportWrite(value, super.editFuture, () {
      super.editFuture = value;
    });
  }

  late final _$sheetsAtom = Atom(name: '_HomeStore.sheets', context: context);

  @override
  ObservableList<Sheet> get sheets {
    _$sheetsAtom.reportRead();
    return super.sheets;
  }

  @override
  set sheets(ObservableList<Sheet> value) {
    _$sheetsAtom.reportWrite(value, super.sheets, () {
      super.sheets = value;
    });
  }

  late final _$topicsAtom = Atom(name: '_HomeStore.topics', context: context);

  @override
  ObservableList<Topic> get topics {
    _$topicsAtom.reportRead();
    return super.topics;
  }

  @override
  set topics(ObservableList<Topic> value) {
    _$topicsAtom.reportWrite(value, super.topics, () {
      super.topics = value;
    });
  }

  late final _$topicsBySheetAtom =
      Atom(name: '_HomeStore.topicsBySheet', context: context);

  @override
  ObservableMap<String, List<Topic>> get topicsBySheet {
    _$topicsBySheetAtom.reportRead();
    return super.topicsBySheet;
  }

  @override
  set topicsBySheet(ObservableMap<String, List<Topic>> value) {
    _$topicsBySheetAtom.reportWrite(value, super.topicsBySheet, () {
      super.topicsBySheet = value;
    });
  }

  late final _$questionIdsAtom =
      Atom(name: '_HomeStore.questionIds', context: context);

  @override
  ObservableList<String> get questionIds {
    _$questionIdsAtom.reportRead();
    return super.questionIds;
  }

  @override
  set questionIds(ObservableList<String> value) {
    _$questionIdsAtom.reportWrite(value, super.questionIds, () {
      super.questionIds = value;
    });
  }

  late final _$questionIdsByCategoryAtom =
      Atom(name: '_HomeStore.questionIdsByCategory', context: context);

  @override
  ObservableMap<String, List<String>> get questionIdsByCategory {
    _$questionIdsByCategoryAtom.reportRead();
    return super.questionIdsByCategory;
  }

  @override
  set questionIdsByCategory(ObservableMap<String, List<String>> value) {
    _$questionIdsByCategoryAtom.reportWrite(value, super.questionIdsByCategory,
        () {
      super.questionIdsByCategory = value;
    });
  }

  late final _$questionsAtom =
      Atom(name: '_HomeStore.questions', context: context);

  @override
  ObservableMap<String, Question> get questions {
    _$questionsAtom.reportRead();
    return super.questions;
  }

  @override
  set questions(ObservableMap<String, Question> value) {
    _$questionsAtom.reportWrite(value, super.questions, () {
      super.questions = value;
    });
  }

  late final _$fetchAllSheetsAsyncAction =
      AsyncAction('_HomeStore.fetchAllSheets', context: context);

  @override
  Future<void> fetchAllSheets() {
    return _$fetchAllSheetsAsyncAction.run(() => super.fetchAllSheets());
  }

  late final _$fetchAllTopicsAsyncAction =
      AsyncAction('_HomeStore.fetchAllTopics', context: context);

  @override
  Future<void> fetchAllTopics() {
    return _$fetchAllTopicsAsyncAction.run(() => super.fetchAllTopics());
  }

  late final _$fetchTopicsBySheetAsyncAction =
      AsyncAction('_HomeStore.fetchTopicsBySheet', context: context);

  @override
  Future<void> fetchTopicsBySheet(String sheetId) {
    return _$fetchTopicsBySheetAsyncAction
        .run(() => super.fetchTopicsBySheet(sheetId));
  }

  late final _$fetchAllQuestionsAsyncAction =
      AsyncAction('_HomeStore.fetchAllQuestions', context: context);

  @override
  Future<void> fetchAllQuestions() {
    return _$fetchAllQuestionsAsyncAction.run(() => super.fetchAllQuestions());
  }

  late final _$fetchQuestionsByTopicAsyncAction =
      AsyncAction('_HomeStore.fetchQuestionsByTopic', context: context);

  @override
  Future<void> fetchQuestionsByTopic(String topicId) {
    return _$fetchQuestionsByTopicAsyncAction
        .run(() => super.fetchQuestionsByTopic(topicId));
  }

  late final _$updateQuestionAsyncAction =
      AsyncAction('_HomeStore.updateQuestion', context: context);

  @override
  Future<Question> updateQuestion(Question question) {
    return _$updateQuestionAsyncAction
        .run(() => super.updateQuestion(question));
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void changePage(int newPage) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.changePage');
    try {
      return super.changePage(newPage);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
sheetsFuture: ${sheetsFuture},
topicsFuture: ${topicsFuture},
questionsFuture: ${questionsFuture},
editFuture: ${editFuture},
sheets: ${sheets},
topics: ${topics},
topicsBySheet: ${topicsBySheet},
questionIds: ${questionIds},
questionIdsByCategory: ${questionIdsByCategory},
questions: ${questions}
    ''';
  }
}
