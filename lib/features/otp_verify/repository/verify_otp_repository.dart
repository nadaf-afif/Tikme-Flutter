import 'package:dartz/dartz.dart';
import 'package:tikme/core/erros/app_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:tikme/model/user_data.dart';
import 'package:tikme/network/api_client.dart';
import 'package:tikme/network/api_end_points.dart';

class VerifyOtpRepository {
  ApiClient apiClient;

  VerifyOtpRepository({
    @required this.apiClient,
  });

  Future<Either<Failure, UserData>> verifyUserOtp(
      String otp, int user_id) async {
    final bodyParams = {"user_id": user_id.toString(), "otp": otp};
    final response =
        await apiClient.postRequestHandle(EndPoints.VERIFY_OTP, bodyParams, {});


    print("${response.request}\n${response.statusCode}\n${response.body}");

    if (response.statusCode == 200) {
      return Right(UserData.fromJson(response.body));
    } else {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, UserData>> generateNewOtp(
      String phoneNumber, int userId, bool changeNumber) async {
    
    final bodyParams = {
      "phone_no": phoneNumber,
      "user_id": userId.toString(),
      "change_in_number": changeNumber.toString()
    };
    
    final response =
        await apiClient.postRequestHandle(EndPoints.RESEND_OTP, bodyParams, {});

    print("${response.request}\n${response.statusCode}\n${response.body}");

    if (response.statusCode == 200) {
      return Right(UserData.fromJson(response.body));
    } else {
      return Left(ServerFailure());
    }
  }
}
