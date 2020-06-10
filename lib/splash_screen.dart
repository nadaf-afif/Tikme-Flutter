import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/core/routes.gr.dart';
import 'package:tikme/core/shared_preference_keys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      handleRedirection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            "assets/splashscreen.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  handleRedirection() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (sharedPrefs.getBool(SharedKeys.IS_LOGGED_IN)?? false) {
      ExtendedNavigator.of(context).pushReplacementNamed(Routes.homeScreenPage);
    } else {
      ExtendedNavigator.of(context)
          .pushReplacementNamed(Routes.userLoginScreen);
    }
  }
}
