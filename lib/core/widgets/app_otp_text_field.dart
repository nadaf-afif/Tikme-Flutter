import 'package:flutter/material.dart';

class OtpTextField extends StatefulWidget {
  FocusNode focusNode;
  Function onTextChange;

  OtpTextField({@required this.focusNode, @required this.onTextChange});

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        counterText: "",
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 1,
      focusNode: widget.focusNode,
      onChanged: (value) {
        widget.onTextChange(value);
      },
    );
  }
}
