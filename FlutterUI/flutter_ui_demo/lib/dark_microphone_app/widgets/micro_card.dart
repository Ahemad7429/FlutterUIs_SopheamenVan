import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/dark_microphone_app/theme/constants.dart';

class MicroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(right: 30),
      width: size.width - 60,
      height: 400,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            height: 350,
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            top: 0,
            left: 80,
            child: Image.asset('assets/images/microphone.png'),
          ),
          Positioned(
            top: 290,
            left: 80,
            child: Column(
              children: [
                Text(
                  'Neumann TLM 103 \n Studio Bundle',
                  style: TextStyle(
                      fontSize: 20,
                      height: 1.6,
                      color: textWhite,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Icon(
                        Icons.star,
                        size: 17,
                        color: primary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
