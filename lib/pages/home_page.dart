import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/model/enums/future_state_enum.dart';
import 'package:revision/core/model/enums/home_page_type.dart';
import 'package:revision/store/home_store.dart';
import 'package:revision/widgets/cupertino_list_view.dart';

class HomePage extends StatefulWidget {
  final HomePageType type;

  HomePage({Key? key, required this.type}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore homeStore;
  List items = [];

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.instance;
    homeStore = getIt<HomeStore>();

    widget.type.fetchData(homeStore);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppStyle.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 26, bottom: 2),
          child: Observer(builder: (context) {
            var loaded = false;
            switch (widget.type) {
              case HomePageType.sheet:
                items = homeStore.sheets;
                loaded = homeStore.sheetsFuture.state == FutureState.loaded;
                break;
              case HomePageType.topic:
                items = homeStore.topics;
                loaded = homeStore.topicsFuture.state == FutureState.loaded;
                break;
              case HomePageType.question:
                items = homeStore.questions.values.toList();
                loaded = homeStore.questionsFuture.state == FutureState.loaded;
                break;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.type.title,
                  style: AppStyle.headingStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: loaded
                      ? SingleChildScrollView(
                          child: CupertinoListView(
                            items: items,
                            pageTitle: widget.type.title,
                          ),
                        )
                      : Center(
                          child: CupertinoActivityIndicator(),
                        ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
