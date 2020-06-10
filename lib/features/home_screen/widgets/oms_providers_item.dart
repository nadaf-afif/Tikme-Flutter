import 'package:flutter/material.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/features/home_screen/data/oms_providers_model.dart';

class OmsProviderItem extends StatelessWidget {
  OmsProvider omsProviderDetails;

  OmsProviderItem({Key key, @required this.omsProviderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 150.0,
      width: 300.0,
      child: Stack(
        children: [
          Positioned(
            top: 5.0,
            left: 30.0,
            right: 0.0,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border.all(
                    width: 1.0,
                    color: Colors.grey[300],
                    style: BorderStyle.solid),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60.0, right: 20.0),
                    child: Hero(
                      tag: "${TagConstants.PROVIDER_NAME}${omsProviderDetails.id}",
                      child: Text(
                        omsProviderDetails.name ?? "",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColorDark),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      transitionOnUserGestures: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0, left: 60.0, right: 5.0),
                    child: Text(
                      "${omsProviderDetails.distance}km | ${omsProviderDetails.address}",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0, left: 60.0, right: 5.0),
                    child: Text(
                      "${omsProviderDetails.oms_order_window_message}",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700]),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: 5.0,
            child: Hero(
              tag: "${TagConstants.PROVIDER_IMAGE}${omsProviderDetails.id}",
              child: Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (omsProviderDetails.profile_image_path != null &&
                              omsProviderDetails.profile_image_path.isNotEmpty)
                          ? NetworkImage(omsProviderDetails.profile_image_path)
                          : AssetImage("assets/splash_logo.jpg"),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.75, 0.75),
                      blurRadius: 3.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
