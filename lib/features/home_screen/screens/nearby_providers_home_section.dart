import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/shared_preference_keys.dart';
import 'package:tikme/core/widgets/app_proress_indicator.dart';
import 'package:tikme/features/home_screen/data/providers_near_by_model.dart';
import 'package:tikme/features/home_screen/provider/nearby_providers_provider.dart';
import 'package:tikme/features/home_screen/widgets/providers_list_item.dart';

class NearbyProvidesListPage extends StatefulWidget {
  double latitude;
  double longitude;
  ProviderRequest requestParams;

  NearbyProvidesListPage({@required this.latitude, @required this.longitude}) {
    requestParams = ProviderRequest(
        lat: this.latitude,
        lng: this.longitude,
        cat_id: "all",
        sub_cat_id: "all",
        child_cat_id: "all",
        query_text: "");
  }

  @override
  _NearbyProvidesListPageState createState() => _NearbyProvidesListPageState();
}

class _NearbyProvidesListPageState extends State<NearbyProvidesListPage> {
  SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  NearbyProviders providersProvider;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NearbyProviders>(context, listen: false).getNearByProviders(
        _sharedPreferences.getString(SharedKeys.AUTH_TOKEN),
        widget.requestParams,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    providersProvider = Provider.of<NearbyProviders>(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
            border: Border.all(
                width: 1.0, color: Colors.grey[300], style: BorderStyle.solid),
          ),
          margin: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Positioned(
                top: 20.0,
                left: 20.0,
                right: 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Providers Nearby",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.7,
                            color: Colors.blue[600])),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.7,
                          color: Colors.blue[600]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 0.0,
          right: 0.0,
          top: 60.0,
          child: (providersProvider.featchingNearByProviders)
              ? Center(
                  child: TikMeProgressIndicator(),
                )
              : (providersProvider.nearbyProviders != null)
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                        final providerDetails =
                            providersProvider.nearbyProviders[position];

                        return ProviderListItem(
                            providerDetails: providerDetails);
                      },
                      itemCount: (providersProvider.nearbyProviders.length >
                              Constants.MAX_HOME_PAGE_COUNT)
                          ? Constants.MAX_HOME_PAGE_COUNT
                          : providersProvider.nearbyProviders.length,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          providersProvider.responsefailure.toString(),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
        ),
      ],
    );
  }
}
