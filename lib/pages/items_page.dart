import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/model/enums/future_state_enum.dart';
import 'package:revision/core/model/question/question.dart';
import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';
import 'package:revision/store/home_store.dart';
import 'package:revision/widgets/cupertino_list_view.dart';

class ItemsPage extends StatefulWidget {
  final dynamic item;
  final String prevPageTitle;

  ItemsPage({
    Key? key,
    required this.item,
    required this.prevPageTitle,
  }) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  dynamic item;
  List items = [];
  bool loaded = false;
  late HomeStore homeStore;

  @override
  void initState() {
    super.initState();

    final getIt = GetIt.instance;
    homeStore = getIt<HomeStore>();

    item = widget.item;

    if (item is Sheet) {
      homeStore.fetchTopicsBySheet(item.id);
    } else if (item is Topic) {
      homeStore.fetchQuestionsByTopic(item.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppStyle.backgroundColor,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CupertinoSliverNavigationBar(
            previousPageTitle: widget.prevPageTitle,
            largeTitle: Text(
              widget.item.title,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          ),
        ],
        body: SafeArea(
          top: false,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 2),
            child: Observer(
              builder: (context) {
                if (item is Sheet) {
                  items = homeStore.topicsBySheet[item.id] ?? [];
                  loaded = homeStore.topicsFuture.state == FutureState.loaded;
                } else if (item is Topic) {
                  final qIds = homeStore.questionIdsByCategory[item.id] ?? [];
                  items = <Question>[];

                  for (final qId in qIds) {
                    if (homeStore.questions.containsKey(qId)) {
                      items.add(homeStore.questions[qId]);
                    }
                  }

                  loaded =
                      homeStore.questionsFuture.state == FutureState.loaded;
                }

                return loaded
                    ? SingleChildScrollView(
                        child: CupertinoListView(
                          items: items,
                          pageTitle: item.title,
                        ),
                      )
                    : Center(
                        child: CupertinoActivityIndicator(),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
