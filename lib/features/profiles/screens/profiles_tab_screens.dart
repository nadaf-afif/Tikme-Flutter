import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikme/core/widgets/app_text_styles.dart';
import 'package:tikme/features/profiles/provider/profile_tabs_data_provider.dart';

class ProfileTabs extends StatefulWidget {
  ProfileTabs({Key key}) : super(key: key);

  @override
  _ProfileTabsState createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs>
    with TickerProviderStateMixin {
  PageController pageController = PageController();

  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => ProfileTabsDataProvider(),
        child: DefaultTabController(
          length: 4,
          initialIndex: tabController.index,
          child: Column(
            children: [
              TabBar(
                indicatorColor: Colors.orange[900],
                labelColor: Colors.orange[900],
                unselectedLabelColor: Colors.orange[600],
                controller: tabController,
                tabs: [
                  Tab(
                    child: TabTitle(title: "Menu"),
                  ),
                  Tab(
                    child: TabTitle(title: "Profile"),
                  ),
                  Tab(
                    child: TabTitle(title: "Deals"),
                  ),
                  Tab(
                    child: TabTitle(title: "Review"),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return getIndexedPage(index);
                  },
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    setState(() {
                      tabController.index = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getIndexedPage(int index) {
    switch (index) {
      case 0:
        return Container(
          color: Colors.amberAccent,
        );
        break;

      case 1:
        return Container(
          color: Colors.blueAccent,
        );
        break;

      case 2:
        return Container(
          color: Colors.redAccent,
        );
        break;

      case 3:
        return Container(color: Colors.green);
        break;

      default:
    }
  }
}
