import 'package:flutter/material.dart';
import 'package:tikme/core/widgets/app_otp_text_field.dart';

class OtpTextFieldWidget extends StatefulWidget {
  
  Function onOtpValueChanged;
  Map<String, String> otpString;

  OtpTextFieldWidget(
      {Key key, @required this.onOtpValueChanged, @required this.otpString})
      : super(key: key);

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextFieldWidget> {
  final firstFocusNode = FocusNode();
  final secondFocusNode = FocusNode();
  final thirdFocusNode = FocusNode();
  final fourthFocusNode = FocusNode();
  final fifthFocusNode = FocusNode();
  final sixthFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: OtpTextField(
                focusNode: firstFocusNode,
                onTextChange: (value) {
                  if (value.isNotEmpty) {
                    FocusScope.of(context).requestFocus(secondFocusNode);
                    widget.otpString["1"] = value;
                  } else {
                    widget.otpString["1"] = null;
                  }
                  widget.onOtpValueChanged("1", widget.otpString["1"]);
                },
              ),
              flex: 3,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: OtpTextField(
                focusNode: secondFocusNode,
                onTextChange: (value) {
                  if (value.isNotEmpty) {
                    FocusScope.of(context).requestFocus(thirdFocusNode);
                    widget.otpString["2"] = value;
                  } else {
                    FocusScope.of(context).requestFocus(firstFocusNode);
                    widget.otpString["2"] = null;
                  }
                  widget.onOtpValueChanged("2",  widget.otpString["2"]);
                },
              ),
              flex: 3,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: OtpTextField(
                focusNode: thirdFocusNode,
                onTextChange: (value) {
                  if (value.isNotEmpty) {
                    FocusScope.of(context).requestFocus(fourthFocusNode);
                    widget.otpString["3"] = value;
                  } else {
                    FocusScope.of(context).requestFocus(secondFocusNode);
                    widget.otpString["3"] = null;
                  }
                  widget.onOtpValueChanged("3",  widget.otpString["3"]);
                },
              ),
              flex: 3,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: OtpTextField(
                focusNode: fourthFocusNode,
                onTextChange: (value) {
                  if (value.isNotEmpty) {
                    FocusScope.of(context).requestFocus(fifthFocusNode);
                    widget.otpString["4"] = value;
                  } else {
                    FocusScope.of(context).requestFocus(thirdFocusNode);
                    widget.otpString["4"] = null;
                  }
                  widget.onOtpValueChanged("4",  widget.otpString["4"]);
                },
              ),
              flex: 3,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: OtpTextField(
                focusNode: fifthFocusNode,
                onTextChange: (value) {
                  if (value.isNotEmpty) {
                    FocusScope.of(context).requestFocus(sixthFocusNode);
                    widget.otpString["5"] = value;
                  } else {
                    FocusScope.of(context).requestFocus(fourthFocusNode);
                    widget.otpString["5"] = null;
                  }
                  widget.onOtpValueChanged("5",  widget.otpString["5"]);
                },
              ),
              flex: 3,
            ),
            Spacer(
              flex: 1,
            ),
            Flexible(
              child: OtpTextField(
                focusNode: sixthFocusNode,
                onTextChange: (value) {
                  if (value.isEmpty) {
                    FocusScope.of(context).requestFocus(fifthFocusNode);
                    widget.otpString["6"] = null;
                  } else {
                    widget.otpString["6"] = value;
                  }
                  widget.onOtpValueChanged("6",  widget.otpString["6"]);
                },
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
