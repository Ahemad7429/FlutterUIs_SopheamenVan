import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/screens/instagram_home_screen.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/screens/instagram_search_screen.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/theme/colors.dart';

class InstagramRootScreen extends StatefulWidget {
  @override
  _InstagramRootScreenState createState() => _InstagramRootScreenState();
}

class _InstagramRootScreenState extends State<InstagramRootScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: getAppBar(),
        backgroundColor: black,
        body: getBody(),
        bottomNavigationBar: getBottomNavBar(),
      ),
    );
  }

  Widget getAppBar() {
    switch (selectedTab) {
      case 0:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/instagram_app/camera_icon.svg",
                width: 30,
              ),
              Text(
                "Instagram",
                style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
              ),
              SvgPicture.asset(
                "assets/images/instagram_app/message_icon.svg",
                width: 30,
              ),
            ],
          ),
        );
        break;
      case 1:
        return null;
        break;
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          title: Text("Upload"),
        );
        break;
      case 3:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          title: Text("Activity"),
        );
        break;
      case 4:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appBarColor,
          title: Text("Account"),
        );
        break;
      default:
        return null;
    }
  }

  Widget getBody() {
    List<Widget> pages = [
      InstagramHomeScreen(),
      InstagramSearchScreen(),
      Center(
        child: Text(
          "Upload Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          "Activity Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          "Account Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      )
    ];
    return IndexedStack(
      index: selectedTab,
      children: pages,
    );
  }

  Widget getBottomNavBar() {
    List<String> bottomItems = [
      selectedTab == 0
          ? 'assets/images/instagram_app/home_active_icon.svg'
          : 'assets/images/instagram_app/home_icon.svg',
      selectedTab == 1
          ? 'assets/images/instagram_app/search_active_icon.svg'
          : 'assets/images/instagram_app/search_icon.svg',
      selectedTab == 2
          ? 'assets/images/instagram_app/upload_active_icon.svg'
          : 'assets/images/instagram_app/upload_icon.svg',
      selectedTab == 3
          ? 'assets/images/instagram_app/love_active_icon.svg'
          : 'assets/images/instagram_app/love_icon.svg',
      selectedTab == 4
          ? 'assets/images/instagram_app/account_active_icon.svg'
          : 'assets/images/instagram_app/account_icon.svg',
    ];

    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: appFooterColor),
      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          bottomItems.length,
          (index) => InkWell(
              onTap: () {
                setState(() {
                  selectedTab = index;
                });
              },
              child: SvgPicture.asset(
                bottomItems[index],
                width: 27,
              )),
        ),
      ),
    );
  }
}
