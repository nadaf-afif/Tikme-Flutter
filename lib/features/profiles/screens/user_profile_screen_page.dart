import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tikme/core/constants.dart';
import 'package:tikme/features/profiles/screens/profiles_tab_screens.dart';

class UserProfilePage extends StatefulWidget {
  String profileImage;
  String providerName;
  int providerId;

  UserProfilePage({
    Key key,
    @required this.profileImage,
    @required this.providerName,
    @required this.providerId,
  }) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.share), onPressed: null)],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${TagConstants.PROVIDER_IMAGE}${widget.providerId}",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: (widget.profileImage != null &&
                                      widget.profileImage.isNotEmpty)
                                  ? NetworkImage(widget.profileImage)
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Hero(
                            tag:
                                "${TagConstants.PROVIDER_NAME}${widget.providerId}",
                            child: Text(
                              widget.providerName ?? "",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColorDark),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            "Business Name",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          RatingBar(
                            onRatingUpdate: (value) {},
                            direction: Axis.horizontal,
                            itemCount: 5,
                            initialRating: 4.0,
                            itemSize: 14.0,
                            unratedColor: Colors.grey,
                            itemBuilder: (context, index) {
                              return Icon(
                                Icons.star,
                                color: Theme.of(context).primaryColor,
                              );
                            },
                          ),
                          Text(
                            "Oms Status",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            flex: 3,
          ),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.blue[200],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.email,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.blue[200],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.call,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.blue[200],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.chat,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.blue[200],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.web,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            flex: 2,
            fit: FlexFit.loose,
          ),
          Flexible(
            child: ProfileTabs(),
            flex: 13,
            fit: FlexFit.tight,
          )
        ],
      ),
    );
  }
}
