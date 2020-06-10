import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/core/routes.gr.dart';
import 'package:tikme/core/widgets/rounded_border_raised_button.dart';
import 'package:tikme/features/login/bloc/login_bloc.dart';

class MobileValidationPage extends StatelessWidget {
  final String errorString;
  String mobileNumber = "";
  TextEditingController mobileController;
  TapGestureRecognizer gestureRecognizer;

  MobileValidationPage({@required this.errorString, this.mobileNumber}) {
    mobileController = TextEditingController(text: mobileNumber);
    gestureRecognizer = TapGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              focusColor: Colors.deepOrangeAccent[100],
              labelText: Constants.MOBILE_NUMBER_LABEL,
              hintText: Constants.MOBILE_NUMBER_HINT,
              errorText: errorString,
              counterText: "",
            ),
            controller: mobileController,
            keyboardType: TextInputType.number,
            maxLength: 12,
            maxLines: 1,
            maxLengthEnforced: true,
          ),
          SizedBox(
            height: 100.0,
          ),
          RoundedBorderRaisedButton(
              onButtonPressed: () {
                _generateOtpClicked(context);
              },
              buttonText: "Generate OTP"),
          SizedBox(
            height: 50.0,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Don't have account?",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal)),
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: "Create New Account.",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: gestureRecognizer
                    ..onTap = () => _openSignUpPage(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openSignUpPage(BuildContext context) {
    ExtendedNavigator.of(context).pushNamed(Routes.userSignScreen);
  }

  void _generateOtpClicked(BuildContext context) {
    final _blocProvdider = BlocProvider.of<LoginBloc>(context);
    if (_blocProvdider.isNumberValid(mobileController.text)) {
      _blocProvdider.add(LoginUser(phoneNumber: mobileController.text));
    } else {
      _blocProvdider.add(ErrorEvent(
          message: ErrorConstants.MOBILE_NUMBER_ERROR,
          mobileNumber: mobileController.text));
    }
  }
}
