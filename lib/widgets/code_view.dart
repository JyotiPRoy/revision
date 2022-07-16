import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/themes/tomorrow-night.dart';
import 'package:revision/app_style.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

class CodeView extends StatefulWidget {
  final String code;

  CodeView({Key? key, required this.code}) : super(key: key);

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: AppStyle.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Text(
            'Code:',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: tomorrowNightTheme['root']!.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: HighlightView(
              widget.code,
              language: 'C++',
              theme: tomorrowNightTheme,
              padding: const EdgeInsets.all(10.0),
              tabSize: 4,
            ),
          ),
        ),
      ],
    );
  }
}
