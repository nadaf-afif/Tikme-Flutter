
import 'package:auto_route/auto_route_annotations.dart';
import 'package:tikme/features/home_screen/home_screen_page.dart';
import 'package:tikme/features/login/login_page.dart';
import 'package:tikme/features/otp_verify/otp_verify_page.dart';
import 'package:tikme/features/profiles/screens/user_profile_screen_page.dart';
import 'package:tikme/features/signup/user_sign_up.dart';
import 'package:tikme/splash_screen.dart';

@MaterialAutoRouter()
class $Router {

  @initial
  SplashScreen splashScreen;

  UserLogin userLoginScreen;

  UserSignUp userSignScreen;

  OtpVerificationPage otpVerificationPage;

  HomeScreenPage homeScreenPage;

  UserProfilePage userProfilePage;

}
