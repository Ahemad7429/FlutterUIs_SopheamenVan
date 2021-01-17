import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/constant/search_json.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/theme/colors.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/widgets/category_story_item.dart';

class InstagramSearchScreen extends StatefulWidget {
  @override
  _InstagramSearchScreenState createState() => _InstagramSearchScreenState();
}

class _InstagramSearchScreenState extends State<InstagramSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 15),
                Container(
                  height: 45,
                  width: size.width - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: white.withOpacity(0.3),
                        )),
                    style: TextStyle(
                      color: white.withOpacity(0.3),
                    ),
                    cursorColor: white.withOpacity(0.3),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(
                    searchCategories.length,
                    (index) => CategoryStoryItem(
                      name: searchCategories[index],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Wrap(
              spacing: 1,
              runSpacing: 1,
              children: List.generate(
                searchImages.length,
                (index) => Container(
                  height: (size.width - 3) / 3,
                  width: (size.width - 3) / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(searchImages[index]),
                      fit: BoxFit.cover,
                    ),
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
