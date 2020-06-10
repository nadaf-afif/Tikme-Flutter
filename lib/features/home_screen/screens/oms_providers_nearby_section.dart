import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/routes.gr.dart';
import 'package:tikme/core/shared_preference_keys.dart';
import 'package:tikme/core/widgets/app_proress_indicator.dart';
import 'package:tikme/features/home_screen/provider/oms_providers_provider.dart';
import 'package:tikme/features/home_screen/widgets/oms_providers_item.dart';

class OmsProvidersNearBy extends StatefulWidget {
  double latitude;
  double longitude;

  OmsProvidersNearBy(
      {Key key, @required this.latitude, @required this.longitude})
      : super(key: key);

  @override
  _OmsProvidersNearByState createState() => _OmsProvidersNearByState();
}

class _OmsProvidersNearByState extends State<OmsProvidersNearBy> {
  SharedPreferences sharedPreference = locator();

  OmsProvidersProvider omsProvider;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<OmsProvidersProvider>(context, listen: false)
          .getNearByOmsProviders(
              sharedPreference.getString(SharedKeys.AUTH_TOKEN),
              widget.latitude,
              widget.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    omsProvider = Provider.of<OmsProvidersProvider>(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
            border: Border.all(
                width: 1.0, color: Colors.grey[300], style: BorderStyle.solid),
          ),
          margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("OMS Providers",
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
        Positioned(
          top: 60.0,
          bottom: 10.0,
          left: 0.0,
          right: 0.0,
          child: (omsProvider.isFetchingData)
              ? Center(
                  child: TikMeProgressIndicator(),
                )
              : (omsProvider.nearByOmsProviders != null)
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: OmsProviderItem(
                                omsProviderDetails:
                                    omsProvider.nearByOmsProviders[index]),
                            onTap: () {
                                ExtendedNavigator.of(context).pushNamed(Routes.userProfilePage,
                                 arguments: UserProfilePageArguments(profileImage: omsProvider.nearByOmsProviders[index].profile_image_path,
                                 providerName: omsProvider.nearByOmsProviders[index].name, 
                                 providerId: omsProvider.nearByOmsProviders[index].id));
                            },
                          );
                        },
                        itemCount: omsProvider.nearByOmsProviders.length,
                      ),
                    )
                  : Container(
                      child: Text("Data loaded failed."),
                    ),
        )
      ],
    );
  }
}
