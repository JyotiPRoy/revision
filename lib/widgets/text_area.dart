import 'package:flutter/cupertino.dart';
import 'package:revision/app_style.dart';

class TextArea extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final void Function(String) onChanged;

  const TextArea({
    Key? key,
    required this.title,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

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
            '$title:',
            style: TextStyle(color: CupertinoColors.white),
          ),
        ),
        CupertinoTextField(
          onChanged: onChanged,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          controller: controller,
          style: AppStyle.bodyTextStyle,
          decoration: BoxDecoration(
            color: AppStyle.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
