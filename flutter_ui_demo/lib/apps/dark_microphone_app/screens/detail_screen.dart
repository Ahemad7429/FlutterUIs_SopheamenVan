import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_demo/apps/dark_microphone_app/theme/constants.dart';
import 'package:flutter_ui_demo/apps/dark_microphone_app/widgets/slider.dart'
    as slider;

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailBackground,
      appBar: AppBar(
        backgroundColor: detailBackground,
        elevation: 0,
        leading: FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: SvgPicture.asset(
            'assets/images/back_icon.svg',
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: slider.Slider(),
        ),
        SizedBox(height: 0),
        Container(
          margin: EdgeInsets.only(left: 30),
          padding: EdgeInsets.only(
            top: 50,
            left: 45,
            right: 45,
            bottom: 45,
          ),
          decoration: BoxDecoration(
            color: homeBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DPA 4018V-B-B01',
                style: TextStyle(
                  fontSize: 30,
                  color: textWhite,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Vocal Microphones',
                style: TextStyle(
                  fontSize: 20,
                  color: textWhite.withOpacity(0.8),
                  letterSpacing: 1,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Opacity(
                        opacity: index > 2 ? 0.2 : 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Icon(
                            Icons.star,
                            size: 20,
                            color: primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "27 Ratings",
                    style: TextStyle(
                      color: textWhite,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Mauris ultrices est volutpat felis pretium eleifend. Cras gravida dui et porta feugiat. Phasellus eget aliquam lacus. Sed eget orci ac eros gravida iaculis. Nullam aliquam vel turpis malesuada mollis. Vestibulum at ipsum porta nibh ultrices finibus facilisis nec magna. Pellentesque sed leo feugiat, fringilla est ut, semper tellus. Donec sed accumsan dolor. Nulla facilisi. Cras mollis porta justo, id bibendum ante. Integer facilisis porta leo, nec pretium arcu eleifend a. Fusce congue mi at eros tincidunt, vel rhoncus magna malesuada. Vestibulum non mi quis lacus mollis tempor ut quis ligula.',
                style: TextStyle(
                  color: textWhite,
                  fontSize: 18,
                  height: 1.6,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
