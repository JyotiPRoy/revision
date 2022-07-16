import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/model/enums/home_page_type.dart';
import 'package:revision/pages/home_page.dart';
import 'package:revision/store/home_store.dart';
import 'package:revision/widgets/nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeStore homeStore;
  late PageController pageController;
  List<ReactionDisposer>? disposers;

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.instance;
    homeStore = getIt<HomeStore>();
    pageController = PageController();
  }

  @override
  void didChangeDependencies() {
    disposers ??= [
      reaction(
        (_) => homeStore.currentPage,
        (int currentPage) {
          pageController.jumpToPage(currentPage);
        },
      )
    ];

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    disposers?.forEach((d) => d());
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(type: HomePageType.sheet),
          HomePage(type: HomePageType.topic),
          HomePage(type: HomePageType.question),
          //TODO: AnalyticsPage()
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
