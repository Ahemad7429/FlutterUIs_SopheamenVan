import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/pet_app/screens/pet_home_screen.dart';
import 'package:flutter_ui_demo/apps/pet_app/screens/search_screen.dart';
import 'package:flutter_ui_demo/apps/pet_app/theme/constant.dart';
import 'package:line_icons/line_icons.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(
        LineIcons.home,
        size: 27,
      ),
      // title: Padding(
      //   padding: const EdgeInsets.only(top: 8),
      //   child: Text(
      //     "Home",
      //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      //   ),
      // ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        LineIcons.search,
        size: 27,
      ),
      // title: Padding(
      //   padding: const EdgeInsets.only(top: 8),
      //   child: Text(
      //     "Search",
      //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      //   ),
      // ),
      label: "Search",
    ),
    BottomNavigationBarItem(
      icon: Icon(LineIcons.book, size: 27),
      // title: Padding(
      //   padding: const EdgeInsets.only(top: 8),
      //   child: Text(
      //     "Articles",
      //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      //   ),
      // ),
      label: "Articles",
    ),
    BottomNavigationBarItem(
      icon: Icon(LineIcons.bell, size: 27),
      // title: Padding(
      //   padding: const EdgeInsets.only(top: 8),
      //   child: Text(
      //     "Notification",
      //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      //   ),
      // ),
      label: "Notification",
    ),
    BottomNavigationBarItem(
      icon: Icon(LineIcons.user, size: 27),
      // title: Padding(
      //   padding: const EdgeInsets.only(top: 8),
      //   child: Text(
      //     "Profile",
      //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      //   ),
      // ),
      label: "Profile",
    )
  ];
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeScreenPet(),
    SearchScreen(),
    Center(
      child: Text(
        "Articles",
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        "Notifications",
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 40),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          items: items,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: primary,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget getBody() {
    return pages.elementAt(selectedIndex);
  }
}
