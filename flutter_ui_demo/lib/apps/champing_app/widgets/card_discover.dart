import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_demo/apps/champing_app/theme/constants.dart';

class CardDiscover extends StatelessWidget {
  final String imgSrc;
  final String title;

  const CardDiscover({@required this.imgSrc, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(imgSrc),
          Text(
            title,
            style: TextStyle(
              color: textBlack.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
