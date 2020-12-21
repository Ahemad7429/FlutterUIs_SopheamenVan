import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_demo/apps/dark_microphone_app/screens/detail_screen.dart';
import 'package:flutter_ui_demo/apps/dark_microphone_app/theme/constants.dart';
import 'package:flutter_ui_demo/apps/dark_microphone_app/widgets/micro_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: homeBackground,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Microphones',
              style: appSubTitle,
            ),
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: SvgPicture.asset('assets/images/burger_icon.svg'),
          )
        ],
      ),
      body: getBody(context),
    );
  }

  Widget getBody(context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                'Largo Diapghram Microphones'.toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 1,
                  color: textWhite.withOpacity(0.8),
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(),
                          ),
                        );
                      },
                      child: MicroCard(),
                    ),
                    MicroCard(),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Vocal Microphones'.toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 1,
                  color: textWhite.withOpacity(0.8),
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 50),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MicroCard(),
                    MicroCard(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
