import 'package:flutter/cupertino.dart';
import 'package:revision/app_style.dart';

class NoteView extends StatefulWidget {
  final String note;

  NoteView({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
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
            'Note:',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppStyle.primaryColor,
          ),
          child: CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.dark),
            child: Text(
              widget.note,
              style: AppStyle.bodyTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
