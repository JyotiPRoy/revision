import 'package:flutter/material.dart';
import 'package:revision/app_style.dart';
import 'package:revision/widgets/def_list_tile.dart';

class CupertinoListView extends StatefulWidget {
  final List<dynamic> items;
  final String pageTitle;

  CupertinoListView({
    Key? key,
    required this.items,
    required this.pageTitle,
  }) : super(key: key);

  @override
  State<CupertinoListView> createState() => _CupertinoListViewState();
}

class _CupertinoListViewState extends State<CupertinoListView> {
  @override
  Widget build(BuildContext context) {
    final items = widget.items;

    return Container(
      decoration: BoxDecoration(
        color: AppStyle.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: items.map((e) {
          return Column(
            children: [
              DefaultListTile(
                item: e,
                pageTitle: widget.pageTitle,
              ),
              e != items.last
                  ? Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Divider(
                        height: 0.5,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          );
        }).toList(),
      ),
    );
  }
}
