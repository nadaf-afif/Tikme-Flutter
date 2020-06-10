import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/routes.gr.dart';
import 'package:tikme/core/widgets/app_proress_indicator.dart';
import 'package:tikme/core/widgets/rounded_border_raised_button.dart';
import 'package:tikme/features/otp_verify/bloc/verify_otp_bloc.dart';
import 'package:tikme/features/otp_verify/widgets/otp_fields_widget.dart';

class OtpVerificationPage extends StatefulWidget {
  final int userId;
  final String mobileNumber;

  OtpVerificationPage({@required this.userId, @required this.mobileNumber})
      : super();

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TapGestureRecognizer tapGestureRecognizer;

  Map<String, String> otpString = {
    "1": null,
    "2": null,
    "3": null,
    "4": null,
    "5": null,
    "6": null
  };

  @override
  void initState() {
    super.initState();
    tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyOtpBloc>(
      create: (context) => locator<VerifyOtpBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("Verify OTP"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              color: Colors.white),
          child: BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "OTP sent on ",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.grey[800])),
                          TextSpan(
                            text: " ${widget.mobileNumber}. ",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Edit Number?",
                            recognizer: tapGestureRecognizer
                              ..onTap =
                                  () => ExtendedNavigator.of(context).pop(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColorDark,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    OtpTextFieldWidget(
                      otpString: otpString,
                      onOtpValueChanged: (index, value) {
                        otpString[index] = value;
                        onOtpValueChanges(context);
                      },
                    ),
                    (state is OtpErrorState)
                        ? const SizedBox(
                            height: 20.0,
                          )
                        : Container(),
                    (state is OtpErrorState)
                        ? Text(
                            "${state.message}",
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.redAccent),
                          )
                        : Container(),
                    (state is OtpGenerateSuccess)
                        ? Text(
                            "${state.message}",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.green),
                          )
                        : Container(),
                    const SizedBox(
                      height: 80.0,
                    ),
                    (state is OtpValidState || !otpString.values.contains(null))
                        ? RoundedBorderRaisedButton(
                            onButtonPressed: () {
                              _showProgressDialog(context, "Proceed");
                              BlocProvider.of<VerifyOtpBloc>(context).add(
                                  VerifyUser(
                                      otp: getOtpFromMap(),
                                      user_id: widget.userId));
                            },
                            buttonText: "Proceed",
                          )
                        : RoundedBorderRaisedButton(
                            onButtonPressed: () {
                              _showProgressDialog(context, "Proceed");
                              BlocProvider.of<VerifyOtpBloc>(context).add(
                                  ResendOtpEvent(
                                      phone_number: widget.mobileNumber,
                                      user_id: widget.userId,
                                      change_in_number: false));
                            },
                            buttonText: "Resend OTP",
                          ),
                  ],
                ),
              );
            },
            condition: (previous, current) {
              if (previous is VerifyingUserState ||
                  previous is NewOtpGenerationState) {
                if (current is VerifiedUserState ||
                    current is OtpErrorState ||
                    current is OtpGenerateSuccess) {
                  Navigator.of(context).pop();
                  if (current is VerifiedUserState) {
                    ExtendedNavigator.of(context).pushNamedAndRemoveUntil(
                        Routes.homeScreenPage, (route) => false);
                  }
                }
              }
              return true;
            },
          ),
        ),
      ),
    );
  }

  void _showProgressDialog(BuildContext context, String state) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: getDialogWidget(context, state),
        );
      },
    );
  }

  Widget getDialogWidget(BuildContext context, String state) {
    switch (state) {
      case "Proceed":
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TikMeProgressIndicator(),
              SizedBox(
                height: 20.0,
              ),
              Text("Verifying OTP...")
            ],
          ),
        );
        break;

      case "Success":
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.done_all),
                onPressed: null,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedBorderRaisedButton(
                onButtonPressed: () {
                  ExtendedNavigator.of(context)
                      .pushNamed(Routes.homeScreenPage);
                },
                buttonText: "OK",
              )
            ],
          ),
        );
        break;
    }
  }

  void onOtpValueChanges(BuildContext context) {
    BlocProvider.of<VerifyOtpBloc>(context).add(
        OtpValueChangeEvent(isOtpValid: (!otpString.values.contains(null))));
  }

  String getOtpFromMap() {
    String otp = "";
    otpString.values.forEach((element) {
      otp = "$otp$element";
    });

    return otp;
  }

  void onResendOtpClicked() {}
}
