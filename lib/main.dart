import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:revision/api_constants.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/services/api_service.dart';
import 'package:revision/pages/home_view.dart';
import 'package:revision/store/home_store.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

  initAppData();
  runApp(const MyApp());
}

void initAppData() async {
  final getIt = GetIt.instance;
  final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  getIt.registerSingleton(ApiService(dio));
  getIt.registerSingleton(HomeStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        barBackgroundColor: AppStyle.backgroundColor,
        primaryColor: CupertinoColors.white,
      ),
      home: const HomeView(),
    );
  }
}
