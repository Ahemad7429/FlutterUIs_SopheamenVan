import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/screens/tik_tok_home_screen.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/theme/colors.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/widgets/tik_tok_icons.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/widgets/upload_icon.dart';

class TikTokRootScreen extends StatefulWidget {
  @override
  _TikTokRootScreenState createState() => _TikTokRootScreenState();
}

class _TikTokRootScreenState extends State<TikTokRootScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        TikTokHomeScreen(),
        Center(
          child: Text(
            'Discover',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        Center(
          child: Text(
            'Upload',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        Center(
          child: Text(
            'All Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        ),
        Center(
          child: Text(
            'Me',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: black,
            ),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    //var size = MediaQuery.of(context).size;

    List bottomItems = [
      {"icon": TikTokIcons.home, "label": "Home", "isIcon": true},
      {"icon": TikTokIcons.search, "label": "Discover", "isIcon": true},
      {"icon": "", "label": "", "isIcon": false},
      {"icon": TikTokIcons.messages, "label": "Inbox", "isIcon": true},
      {"icon": TikTokIcons.profile, "label": "Me", "isIcon": true}
    ];

    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: appBgColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            bottomItems.length,
            (index) => bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () => changeTab(index),
                    child: Column(
                      children: [
                        Icon(
                          bottomItems[index]['icon'],
                          color: white,
                        ),
                        SizedBox(height: 5),
                        Center(
                          child: Text(
                            bottomItems[index]['label'],
                            style: TextStyle(color: white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () => changeTab(index),
                    child: UploadIcon(),
                  ),
          ),
        ),
      ),
    );
  }

  void changeTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
