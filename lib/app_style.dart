import 'package:flutter/cupertino.dart';

class AppStyle {
  static const backgroundColor = Color.fromRGBO(28, 21, 37, 1);
  static const primaryColor = Color.fromRGBO(44, 36, 63, 1);
  static const accentColor = Color.fromRGBO(241, 152, 78, 1);

  static const headingStyle = TextStyle(
    color: CupertinoColors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const headingSmallerStyle = TextStyle(
    color: CupertinoColors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const listTitleStyle = TextStyle(
    color: CupertinoColors.white,
    fontSize: 14,
  );

  static final listUnsolvedStyle = listTitleStyle.copyWith(
    color: CupertinoColors.white.withOpacity(0.3),
  );

  static const bodyTextStyle = TextStyle(
    color: CupertinoColors.white,
    fontSize: 16,
  );
}
