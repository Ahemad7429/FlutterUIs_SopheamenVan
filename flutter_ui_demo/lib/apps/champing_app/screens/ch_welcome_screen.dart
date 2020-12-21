import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_demo/apps/champing_app/screens/ch_home_screen.dart';
import 'package:flutter_ui_demo/apps/champing_app/theme/constants.dart';

class ChWelcomeScreen extends StatefulWidget {
  @override
  _ChWelcomeScreenState createState() => _ChWelcomeScreenState();
}

class _ChWelcomeScreenState extends State<ChWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/images/welcome_image.svg'),
            Column(
              children: [
                Text(
                  'Find yourself\noutside',
                  style: appTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Book unique camping experience on over 300,300 campsites cabins. RV parks, public parks and more.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: primary,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CHHomeScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 45,
                child: Center(
                  child: Text(
                    'Explore Now!',
                    style: TextStyle(color: textWhite),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
