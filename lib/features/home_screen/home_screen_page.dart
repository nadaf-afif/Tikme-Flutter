import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikme/core/depedency_injector.dart';
import 'package:tikme/core/shared_preference_keys.dart';
import 'package:tikme/features/home_screen/provider/nearby_providers_provider.dart';
import 'package:tikme/features/home_screen/provider/oms_providers_provider.dart';
import 'package:tikme/features/home_screen/screens/nearby_providers_home_section.dart';
import 'package:tikme/features/home_screen/screens/oms_providers_nearby_section.dart';

class HomeScreenPage extends StatefulWidget {
  HomeScreenPage({Key key}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    sharedPreferences = locator<SharedPreferences>();
    super.initState();
  }

  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        sharedPreferences.getString(SharedKeys.PROFILE_IMAGE)),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Container(
                      height: 90.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black54,
                            Colors.black38,
                            Colors.black12,
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${sharedPreferences.getString(SharedKeys.USER_NAME).trim()}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${sharedPreferences.getInt(SharedKeys.TIKME_REWARD_POINTS)} Pts",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            actions: [
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              IconButton(icon: Icon(Icons.chat), onPressed: () {})
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 315.0,
              width: double.infinity,
              child: ChangeNotifierProvider(
                create: (context) => NearbyProviders(),
                child: NearbyProvidesListPage(
                  latitude: 18.5851278,
                  longitude: 73.8301434,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 180.0,
              child: ChangeNotifierProvider(
                create: (context) => OmsProvidersProvider(),
                child: OmsProvidersNearBy(
                  latitude: 18.5851278,
                  longitude: 73.8301434,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
