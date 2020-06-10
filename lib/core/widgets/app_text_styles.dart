import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  String title;

  TabTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        letterSpacing: 0.75,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
