import 'package:flutter/foundation.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/erros/app_error.dart';
import 'package:tikme/features/home_screen/data/providers_near_by_model.dart';
import 'package:tikme/features/home_screen/repository/nearby_provides_repository.dart';

class NearbyProviders with ChangeNotifier {
  // api response object
  ProviderNearByResponse nearbyProvidersResponse = null;

  // list of providers from my location
  List<Providers> nearbyProviders = List();

  // responsible to get data from server
  NearbyProvidesRespotory nearbyProvidesRespotory = locator();

  // manage data fetch and loaded state on UI
  bool featchingNearByProviders = true;

  // failure or exception on response
  Failure responsefailure = null;

  // this method is reponsible to get providers near by with help of location , filter parameters
  // and search key and all these parameters are set in request object [requestParams]

  void getNearByProviders(
    String authToken,
    ProviderRequest requestParams,
  ) async {
    
    final response = await nearbyProvidesRespotory.fetchProvidersNearby(
        authToken: authToken, requestParams: requestParams);

    response.fold(
      (exception) {
        responsefailure = exception;
        featchingNearByProviders = false;
        notifyListeners();
      },
      (response) {
        nearbyProviders.clear();
        nearbyProvidersResponse = response;
        nearbyProviders.addAll(response.data);
        featchingNearByProviders = false;
        notifyListeners();
      },
    );
  }

  void setLoadingPage() {
    featchingNearByProviders = true;
    notifyListeners();
  }
}
