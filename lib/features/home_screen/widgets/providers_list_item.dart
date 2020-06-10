import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tikme/features/home_screen/data/providers_near_by_model.dart';

class ProviderListItem extends StatelessWidget {
  final Providers providerDetails;
  const ProviderListItem({Key key, @required this.providerDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: 185.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.0, top: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.lightGreen[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.75, 0.75),
                    blurRadius: 2.0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 55.0, top: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingBar(
                                onRatingUpdate: (_) {},
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 14.0,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                unratedColor: Colors.grey[300],
                                allowHalfRating: true,
                                initialRating: providerDetails.average_ratings
                                        .toDouble() ??
                                    0.0,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.amberAccent[700],
                                  );
                                },
                              ),
                              SizedBox(width: 2.0,),
                              Text(
                                "(${providerDetails.total_reviews})",
                                style: TextStyle(
                                    fontSize: 9.0, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.0, left: 55.0, right: 20.0),
                        child: Text(
                          providerDetails.user_name,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColorDark),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 10.0),
                        child: Text(
                          (providerDetails.business_name != null &&
                                  providerDetails.business_name.isNotEmpty)
                              ? providerDetails.business_name
                              : "NA",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Text(
                          (providerDetails.l1_categories != null &&
                                  providerDetails.l1_categories.isNotEmpty)
                              ? providerDetails.l1_categories
                              : "NA",
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        child: Text(
                          (providerDetails.language != null &&
                                  providerDetails.language.isNotEmpty)
                              ? providerDetails.language
                              : "NA",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, bottom: 10.0, top: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.indigo[600],
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "${providerDetails.distance.toString().trim()} Km",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: (providerDetails.profile_image_path != null &&
                          providerDetails.profile_image_path.isNotEmpty)
                      ? NetworkImage(providerDetails.profile_image_path)
                      : AssetImage("assets/splash_logo.jpg"),
                  fit: BoxFit.cover,
                ),
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
        ],
      ),
    );
  }

  String getStarsString(num numberOfstars) {
    String stars = "";
    for (var i = 0; i < numberOfstars; i++) {
      stars += "⭐";
    }
    return stars;
  }
}
