import 'package:flutter/cupertino.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/model/question/question.dart';
import 'package:revision/core/model/sheet/sheet.dart';
import 'package:revision/core/model/topic/topic.dart';
import 'package:revision/pages/items_page.dart';
import 'package:revision/pages/question_details.dart';

class DefaultListTile extends StatelessWidget {
  final dynamic item;
  final String pageTitle;

  const DefaultListTile({
    Key? key,
    required this.item,
    required this.pageTitle,
  }) : super(key: key);

  void _onTap(BuildContext context) {
    late Widget destination;

    if (item is Sheet || item is Topic) {
      destination = ItemsPage(
        item: item,
        prevPageTitle: pageTitle,
      );
    } else if (item is Question) {
      destination = QuestionDetailsPage(
        question: item,
        prevPageTitle: pageTitle,
      );
    }

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (_) => destination,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    var titleStyle = AppStyle.listTitleStyle;

    if (item is Question) {
      titleStyle = item.isSolved ? titleStyle : AppStyle.listUnsolvedStyle;
    }

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: AppStyle.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.65,
              child: Text(
                item.title,
                style: titleStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: SizedBox()),
            Icon(
              CupertinoIcons.forward,
              color: CupertinoColors.white,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
