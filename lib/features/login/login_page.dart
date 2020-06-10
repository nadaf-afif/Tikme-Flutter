import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/routes.gr.dart';
import 'package:tikme/core/widgets/app_proress_indicator.dart';
import 'package:tikme/features/login/bloc/login_bloc.dart';
import 'package:tikme/features/login/widgets/mobile_number_page.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => locator<LoginBloc>(),
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            elevation: 0.0,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              color: Colors.white,
            ),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return _getStateWidget(state, context);
                  },
                )),
          ),
        ));
  }
}

Widget _getStateWidget(dynamic state, BuildContext context) {
  if (state is LoginInitial) {
    return MobileValidationPage(errorString: null);
  } else if (state is LoginRequest) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [TikMeProgressIndicator()],
    );
  } else if (state is ValidUserState) {
    ExtendedNavigator.of(context).pushNamed(Routes.otpVerificationPage,
        arguments: OtpVerificationPageArguments(
            userId: state.otpResponse.data.id,
            mobileNumber: state.otpResponse.data.phone_no));
    return MobileValidationPage(errorString: null, mobileNumber:state.otpResponse.data.phone_no,);
  } else if (state is UserInvalidError) {
    return MobileValidationPage(errorString: state.message);
  }
}
