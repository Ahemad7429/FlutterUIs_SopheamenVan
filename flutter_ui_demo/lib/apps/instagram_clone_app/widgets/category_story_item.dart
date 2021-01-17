import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/theme/colors.dart';

class CategoryStoryItem extends StatelessWidget {
  final String name;
  const CategoryStoryItem({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: black,
        border: Border.all(color: white.withOpacity(0.2)),
      ),
      margin: const EdgeInsets.only(
        right: 10,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 25,
        top: 10,
        bottom: 10,
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
    );
  }
}
