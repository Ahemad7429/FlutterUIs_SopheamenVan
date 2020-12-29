import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/pet_app/screens/tabbar_screen.dart';
import 'package:flutter_ui_demo/apps/pet_app/theme/constant.dart';
import 'package:flutter_ui_demo/apps/pet_app/widgets/dog_card.dart';
import 'package:flutter_ui_demo/apps/pet_app/widgets/walk_card_dog.dart';
import 'package:google_fonts/google_fonts.dart';

class PetHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App UI',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: RootPage(),
    );
  }
}

class HomeScreenPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
    );
  }

  Widget getBody(context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Hi, Ferran",
                  style: appTitle,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: size.width * 0.7,
                    child: Text(
                      "Check out the new products, groups, events, places and more!",
                      style: contentBlack,
                    )),
                SizedBox(
                  height: 50,
                ),
                DogCard(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Walk groups".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text("See All")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      WalkGroupCard(
                        imgScr: "assets/images/pet_app/card_dog_1.png",
                        title: "Meet our lovely dogs walking with us",
                        location: "Valencia, Spain",
                        members: "8 memmbers",
                        orgBy: "Laura",
                      ),
                      WalkGroupCard(
                        imgScr: "assets/images/pet_app/card_dog_2.png",
                        title: "Meet our lovely dogs walking with us",
                        location: "Valencia, Spain",
                        members: "8 memmbers",
                        orgBy: "Laura",
                      ),
                      // WalkGroupCard()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
