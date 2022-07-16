import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:revision/app_style.dart';
import 'package:revision/store/home_store.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final activeColor = Colors.white;
  final inactiveColor = Colors.white.withOpacity(0.4);

  late HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    final getIt = GetIt.instance;
    homeStore = getIt<HomeStore>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Observer(
      builder: (context) {

        Color _getColor(int index) =>
            index == homeStore.currentPage ? activeColor : inactiveColor;

        return Container(
          height: height * 0.11,
          decoration: const BoxDecoration(color: AppStyle.primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  homeStore.changePage(0);
                },
                icon: Icon(
                  FontAwesomeIcons.sheetPlastic,
                  size: 22,
                  color: _getColor(0),
                ),
              ),
              IconButton(
                onPressed: () {
                  homeStore.changePage(1);
                },
                icon: Icon(
                  FontAwesomeIcons.barsStaggered,
                  size: 22,
                  color: _getColor(1),
                ),
              ),
              FloatingActionButton(
                elevation: 0,
                backgroundColor: AppStyle.accentColor,
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onPressed: () {},
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 22,
                  color: AppStyle.primaryColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  homeStore.changePage(2);
                },
                icon: Icon(
                  FontAwesomeIcons.code,
                  size: 22,
                  color: _getColor(2),
                ),
              ),
              IconButton(
                onPressed: () {
                  homeStore.changePage(3);
                },
                icon: Icon(
                  FontAwesomeIcons.chartPie,
                  size: 22,
                  color: _getColor(3),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
