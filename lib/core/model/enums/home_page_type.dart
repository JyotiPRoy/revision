import 'package:revision/store/home_store.dart';

enum HomePageType { sheet, topic, question }

extension HomePageTypeExtension on HomePageType {
  String get title {
    switch (this) {
      case HomePageType.sheet:
        return 'Sheets';
      case HomePageType.topic:
        return 'Topics';
      case HomePageType.question:
        return 'Questions';
    }
  }

  void fetchData(HomeStore homeStore) {
    switch (this) {
      case HomePageType.sheet:
        homeStore.fetchAllSheets();
        break;
      case HomePageType.topic:
        homeStore.fetchAllTopics();
        break;
      case HomePageType.question:
        homeStore.fetchAllQuestions();
        break;
    }
  }
}
