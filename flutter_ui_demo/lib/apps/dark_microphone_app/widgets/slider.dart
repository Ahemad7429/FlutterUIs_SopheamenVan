import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/dark_microphone_app/theme/constants.dart';

class Slider extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<Slider> {
  List items = [1, 2, 3, 4, 5, 6, 7];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: items
              .map(
                (item) => Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Image.asset(
                      'assets/images/microphone.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 400,
            autoPlayCurve: Curves.easeIn,
            aspectRatio: 16 / 7,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (index) => Container(
                margin: EdgeInsets.all(8),
                height: index == selectedIndex ? 13 : 10,
                width: index == selectedIndex ? 13 : 10,
                decoration: BoxDecoration(
                  color: index == selectedIndex ? primary : homeBackground,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
