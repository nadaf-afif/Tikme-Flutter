import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tikme/core/routes.gr.dart';
import 'core/depedency_injector.dart' as di;

Future<void> mainCommon(String env) async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDI(env);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange[400],
        primaryColorDark: Colors.deepOrange,
        secondaryHeaderColor: Colors.deepOrange[600],
        focusColor: Colors.deepOrange[100],
        buttonColor: Colors.white,
        accentColor: Colors.white,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor:Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: ExtendedNavigator(router: Router()),
    );
  }
}
