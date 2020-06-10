// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tikme/splash_screen.dart';
import 'package:tikme/features/login/login_page.dart';
import 'package:tikme/features/signup/user_sign_up.dart';
import 'package:tikme/features/otp_verify/otp_verify_page.dart';
import 'package:tikme/features/home_screen/home_screen_page.dart';
import 'package:tikme/features/profiles/screens/user_profile_screen_page.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const userLoginScreen = '/user-login-screen';
  static const userSignScreen = '/user-sign-screen';
  static const otpVerificationPage = '/otp-verification-page';
  static const homeScreenPage = '/home-screen-page';
  static const userProfilePage = '/user-profile-page';
  static const all = {
    splashScreen,
    userLoginScreen,
    userSignScreen,
    otpVerificationPage,
    homeScreenPage,
    userProfilePage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        if (hasInvalidArgs<SplashScreenArguments>(args)) {
          return misTypedArgsRoute<SplashScreenArguments>(args);
        }
        final typedArgs =
            args as SplashScreenArguments ?? SplashScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.userLoginScreen:
        if (hasInvalidArgs<UserLoginArguments>(args)) {
          return misTypedArgsRoute<UserLoginArguments>(args);
        }
        final typedArgs = args as UserLoginArguments ?? UserLoginArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserLogin(key: typedArgs.key),
          settings: settings,
        );
      case Routes.userSignScreen:
        if (hasInvalidArgs<UserSignUpArguments>(args)) {
          return misTypedArgsRoute<UserSignUpArguments>(args);
        }
        final typedArgs = args as UserSignUpArguments ?? UserSignUpArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserSignUp(key: typedArgs.key),
          settings: settings,
        );
      case Routes.otpVerificationPage:
        if (hasInvalidArgs<OtpVerificationPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<OtpVerificationPageArguments>(args);
        }
        final typedArgs = args as OtpVerificationPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => OtpVerificationPage(
              userId: typedArgs.userId, mobileNumber: typedArgs.mobileNumber),
          settings: settings,
        );
      case Routes.homeScreenPage:
        if (hasInvalidArgs<HomeScreenPageArguments>(args)) {
          return misTypedArgsRoute<HomeScreenPageArguments>(args);
        }
        final typedArgs =
            args as HomeScreenPageArguments ?? HomeScreenPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreenPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.userProfilePage:
        if (hasInvalidArgs<UserProfilePageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<UserProfilePageArguments>(args);
        }
        final typedArgs = args as UserProfilePageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserProfilePage(
              key: typedArgs.key,
              profileImage: typedArgs.profileImage,
              providerName: typedArgs.providerName,
              providerId: typedArgs.providerId),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  SplashScreenArguments({this.key});
}

//UserLogin arguments holder class
class UserLoginArguments {
  final Key key;
  UserLoginArguments({this.key});
}

//UserSignUp arguments holder class
class UserSignUpArguments {
  final Key key;
  UserSignUpArguments({this.key});
}

//OtpVerificationPage arguments holder class
class OtpVerificationPageArguments {
  final int userId;
  final String mobileNumber;
  OtpVerificationPageArguments(
      {@required this.userId, @required this.mobileNumber});
}

//HomeScreenPage arguments holder class
class HomeScreenPageArguments {
  final Key key;
  HomeScreenPageArguments({this.key});
}

//UserProfilePage arguments holder class
class UserProfilePageArguments {
  final Key key;
  final String profileImage;
  final String providerName;
  final int providerId;
  UserProfilePageArguments(
      {this.key,
      @required this.profileImage,
      @required this.providerName,
      @required this.providerId});
}
