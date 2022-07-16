import 'package:flutter/cupertino.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/model/question/question.dart';
import 'package:revision/pages/edit_question_page.dart';
import 'package:revision/utils/ui_utils.dart';
import 'package:revision/widgets/code_view.dart';
import 'package:revision/widgets/note_view.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionDetailsPage extends StatefulWidget {
  final Question question;
  final String prevPageTitle;

  QuestionDetailsPage({
    Key? key,
    required this.question,
    required this.prevPageTitle,
  }) : super(key: key);

  @override
  State<QuestionDetailsPage> createState() => _QuestionDetailsPageState();
}

class _QuestionDetailsPageState extends State<QuestionDetailsPage> {
  late Question question;

  @override
  void initState() {
    super.initState();
    question = widget.question;
  }

  void _launch() {
    try {
      if (question.url != null) {
        launchUrl(Uri.parse(question.url!));
      } else {
        throw Exception("Null Url Passed");
      }
    } catch (e) {
      UiUtils.showError(
        message: 'Failed to launch Url. Reason:${e.toString()}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppStyle.backgroundColor,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: widget.prevPageTitle,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => EditQuestionPage(
                  question: question,
                  onUpdate: (update) {
                    setState(() {
                      question = update;
                    });
                  },
                ),
              ),
            );
          },
          child: Text(
            'Edit',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: _launch,
                        child: Text(
                          question.title,
                          style: AppStyle.headingSmallerStyle,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  question.description ?? '',
                  style: AppStyle.bodyTextStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                question.note != null
                    ? NoteView(note: question.note!)
                    : SizedBox.shrink(),
                SizedBox(
                  height: 15,
                ),
                question.code != null
                    ? CodeView(
                        code: question.code!,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
