import 'package:flutter/material.dart';

class RoundedBorderRaisedButton extends StatelessWidget {
  final Function onButtonPressed;
  final String buttonText;

  RoundedBorderRaisedButton(
      {Key key, @required this.onButtonPressed, @required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        shape: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColorDark,
              style: BorderStyle.solid,
              width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
        onPressed: () {
          onButtonPressed();
        },
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 18.0, color: Theme.of(context).primaryColorDark),
              textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
