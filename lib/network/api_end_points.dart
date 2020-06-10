import 'package:tikme/core/app_enviorment.dart';

abstract class EndPoints {
  static const PRIVACY_POLICY = "/privacy_policy";
  static const TERMS_AND_CONDITIONS = "/terms_and_conditions";

  static const SIGNIN_USER = "/api/login";
  static const RESEND_OTP = "/api/resend-otp";
  static const VERIFY_OTP = "/api/verify-otp";
  static const NEAR_BY_PROVIDERS = "/api/get-users-list";
  static const NEAR_BY_OMS_PROVIDERS = "/api/oms_providers";
}

class BaseUrl {
  static const String STAGE_BASE_URL = "https://www.tikme.biz";
  static const String PROD_BASE_URL = "https://www.tikme.app";

  String getBaseUrl(String env) {
    if (env == Enviroment.DEV) {
      return STAGE_BASE_URL;
    } else {
      return PROD_BASE_URL;
    }
  }
}
