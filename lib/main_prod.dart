import 'package:tikme/core/app_enviorment.dart';
import 'package:tikme/main.dart';

Future<void> main() async{
  await mainCommon(Enviroment.PROD);
}
