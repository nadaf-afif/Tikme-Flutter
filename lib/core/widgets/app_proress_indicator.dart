import 'package:flutter/material.dart';

class TikMeProgressIndicator extends StatelessWidget {
  const TikMeProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Theme.of(context).primaryColor,
          height: 60.0,
          width: 60.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
