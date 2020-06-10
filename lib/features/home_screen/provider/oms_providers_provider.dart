import 'package:flutter/material.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/erros/app_error.dart';
import 'package:tikme/features/home_screen/data/oms_providers_model.dart';
import 'package:tikme/features/home_screen/data/providers_near_by_model.dart';
import 'package:tikme/features/home_screen/repository/nearby_provides_repository.dart';

class OmsProvidersProvider with ChangeNotifier {
  
  bool isFetchingData = true;

  OmsProvidersData omsProvidersData = null;

  List<OmsProvider> nearByOmsProviders = null;

  NearbyProvidesRespotory nearbyProvidesRespotory = locator();

  Failure responseFailure = null;

  Future<void> getNearByOmsProviders(
    String authToken,
    double latitude,
    double longitude,
  ) async {

    final requestParams = {"lat": latitude, "lng": longitude};
    final response = await nearbyProvidesRespotory.fetchOmsProvidersNearby(
        authToken: authToken, queryMap: requestParams);

    response.fold((failure) {
        responseFailure = failure;
        isFetchingData = false;
        notifyListeners();
    }, (response) {
        nearByOmsProviders = response.data.providers;
        omsProvidersData = response;
        isFetchingData = false;
        notifyListeners();
    });    
  }
}
