import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/features/home_screen/provider/nearby_providers_provider.dart';
import 'package:tikme/features/home_screen/repository/nearby_provides_repository.dart';
import 'package:tikme/features/login/bloc/login_bloc.dart';
import 'package:tikme/features/login/repository/login_repository.dart';
import 'package:tikme/features/otp_verify/bloc/verify_otp_bloc.dart';
import 'package:tikme/features/otp_verify/repository/verify_otp_repository.dart';
import 'package:tikme/network/api_client.dart';
import 'package:tikme/network/api_end_points.dart';

final locator = GetIt.instance;

Future<void> initDI(String enviroment) async {

  locator.registerLazySingleton(() => LoginBloc(loginRepository: locator()));
  locator.registerLazySingleton(() => VerifyOtpBloc(verifyOtpRepository: locator()));


  // repository depedencies
  locator.registerLazySingleton(() => LoginRepository(apiClient: locator()));
  locator.registerLazySingleton(() => VerifyOtpRepository(apiClient: locator()));
  locator.registerLazySingleton(() => NearbyProvidesRespotory(apiClient: locator()));

  // api client
  locator.registerLazySingleton(() => ApiClient(
      sharedPreferences: locator(), baseUrl: BaseUrl().getBaseUrl(enviroment)));

  // shared preference
  final sharedPreference = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreference);
}
