import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/core/erros/app_error.dart';
import 'package:tikme/features/home_screen/data/oms_providers_model.dart';
import 'package:tikme/features/home_screen/data/providers_near_by_model.dart';
import 'package:tikme/network/api_client.dart';
import 'package:tikme/network/api_end_points.dart';

class NearbyProvidesRespotory {
  ApiClient apiClient;
  NearbyProvidesRespotory({@required this.apiClient});

  Future<Either<Failure, ProviderNearByResponse>> fetchProvidersNearby({
    @required String authToken,
    @required ProviderRequest requestParams,
  }) async {
    final queryMap = requestParams.toMap();
    final headerParams = {"auth_token": authToken};
    final response = await apiClient.getRequestHandle(
        EndPoints.NEAR_BY_PROVIDERS, queryMap, headerParams);

    print(response.request);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        ProviderNearByResponse responseData =
            ProviderNearByResponse.fromJson(response.body);
        if (responseData.status == Constants.SUCCESS) {
          return Right(responseData);
        } else {
          return Left(UnExptectedFailure(message: responseData.message));
        }
      } on Exception {
        return Left(Parsingfailure(response: response.toString()));
      }
    } else {
      return Left(
          UnExptectedFailure(message: ErrorConstants.SOMETHING_WENT_WRONG));
    }
  }

Future<Either<Failure, OmsProvidersData>> fetchOmsProvidersNearby({
    @required String authToken,
    @required Map<String, dynamic> queryMap,
  }) async {
    final headerParams = {"auth_token": authToken};
    final response = await apiClient.getRequestHandle(
        EndPoints.NEAR_BY_OMS_PROVIDERS, queryMap, headerParams);

    print(response.request);
    print(response.body);

    if (response.statusCode == 200) {
      try {
        OmsProvidersData responseData =
            OmsProvidersData.fromJson(response.body);
        if (responseData.status == Constants.SUCCESS) {
          return Right(responseData);
        } else {
          return Left(UnExptectedFailure(message: responseData.message));
        }
      } on Exception {
        return Left(Parsingfailure(response: response.toString()));
      }
    } else {
      return Left(
          UnExptectedFailure(message: ErrorConstants.SOMETHING_WENT_WRONG));
    }
  }


}
