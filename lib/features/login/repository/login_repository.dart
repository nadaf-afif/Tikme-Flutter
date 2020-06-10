import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:tikme/core/erros/app_error.dart';
import 'package:tikme/features/login/data/otp_generate_response.dart';
import 'package:tikme/network/api_client.dart';
import 'package:tikme/network/api_end_points.dart';

class LoginRepository {
  ApiClient apiClient;

  LoginRepository({@required this.apiClient});

  Future<Either<Failure, OtpGenerationResponse>> validateUser(
      String mobile) async {
    final bodyParams = {"mobile": mobile};
    final response = await apiClient
        .postRequestHandle(EndPoints.SIGNIN_USER, bodyParams, {});

    if (response.statusCode == 200) {
      return Right(OtpGenerationResponse.fromJson(response.body));
    } else {
      return Left(Parsingfailure());
    }
  }
}
