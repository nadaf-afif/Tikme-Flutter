import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/core/shared_preference_keys.dart';
import 'package:tikme/model/user_data.dart';

abstract class BaseBloc<Type, Params> extends Bloc<Type, Params> {
  
  
  
  
  
  
  void saveLoggedInDataInPreferences(
      UserData userData, SharedPreferences sharedPreferences) {
    sharedPreferences.setString(
        SharedKeys.USER_INFORMATION, userData.data.toString());
    sharedPreferences.setBool(SharedKeys.IS_LOGGED_IN, true);
    sharedPreferences.setInt(SharedKeys.USER_ID, userData.data.id);
    sharedPreferences.setString(SharedKeys.USER_ROLE, userData.data.role);
    sharedPreferences.setString(SharedKeys.USER_NAME, userData.data.user_name);
    sharedPreferences.setInt(SharedKeys.TIKME_REWARD_POINTS, userData.data.tikme_reward_points);
    sharedPreferences.setString(SharedKeys.AUTH_TOKEN, userData.data.auth_token);
    sharedPreferences.setString(SharedKeys.PROFILE_IMAGE, userData.data.profile_image_path);
  }
}
