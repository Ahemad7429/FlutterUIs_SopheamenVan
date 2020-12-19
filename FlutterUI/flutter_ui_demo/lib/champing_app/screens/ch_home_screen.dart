import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_demo/champing_app/theme/constants.dart';
import 'package:flutter_ui_demo/champing_app/widgets/card_destination.dart';
import 'package:flutter_ui_demo/champing_app/widgets/card_discover.dart';
import 'package:line_icons/line_icons.dart';

class CHHomeScreen extends StatefulWidget {
  @override
  _CHHomeScreenState createState() => _CHHomeScreenState();
}

class _CHHomeScreenState extends State<CHHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/tree_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/images/ch_burger_icon.svg'),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/profile_icon.svg'),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                    color: textWhite.withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Badr Ragab',
                                  style: TextStyle(
                                    color: textWhite,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset('assets/images/notification_icon.svg'),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.only(right: 30, left: 10),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: textWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: TextField(
                          cursorColor: textBlack.withOpacity(0.5),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Here",
                            prefixIcon: Icon(
                              LineIcons.search,
                              color: textBlack.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discover",
                          style: appTitle,
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CardDiscover(
                                imgSrc: 'assets/images/tent_icon.svg',
                                title: 'campus',
                              ),
                              SizedBox(width: 10),
                              CardDiscover(
                                imgSrc: 'assets/images/fishing_icon.svg',
                                title: 'Fishing',
                              ),
                              SizedBox(width: 10),
                              CardDiscover(
                                imgSrc: 'assets/images/cooking_icon.svg',
                                title: 'Cooking',
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.55),
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Align(
                    child: Container(
                      width: 50,
                      height: 3,
                      decoration: BoxDecoration(
                        color: textBlack.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Popular Destinations',
                    style: TextStyle(
                      color: textBlack.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        CardDestination(
                          imgSrc:
                              "https://images.unsplash.com/photo-1550236520-7050f3582da0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          perNight: "45/night",
                          title: "Sandy Ridge Camping",
                          subTitle: "canton",
                          reviews: "86",
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CardDestination(
                          imgSrc:
                              "https://images.unsplash.com/photo-1536431311719-398b6704d4cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          perNight: "36/night",
                          title: "Richardson Creed",
                          subTitle: "ecoRich",
                          reviews: "36",
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
