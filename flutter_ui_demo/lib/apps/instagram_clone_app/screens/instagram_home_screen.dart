import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/constant/post_json.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/constant/story_json.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/theme/colors.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/widgets/post_item.dart';
import 'package:flutter_ui_demo/apps/instagram_clone_app/widgets/story_item.dart';

class InstagramHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          _buildStories(),
          Divider(color: white.withOpacity(0.3)),
          Column(
            children: List.generate(posts.length, (index) {
              return PostItem(
                postImg: posts[index]['postImg'],
                profileImg: posts[index]['profileImg'],
                name: posts[index]['name'],
                caption: posts[index]['caption'],
                isLoved: posts[index]['isLoved'],
                viewCount: posts[index]['commentCount'],
                likedBy: posts[index]['likedBy'],
                dayAgo: posts[index]['dayAgo'],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildStories() {
    return Container(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 20, bottom: 10),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 19,
                              height: 19,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: white),
                              child: Icon(
                                Icons.add_circle,
                                color: buttonFollowColor,
                                size: 19,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 70,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: white),
                    ),
                  )
                ],
              ),
            );
          }

          return StoryItem(
            img: stories[index - 1]['img'],
            name: stories[index - 1]['name'],
          );
        },
      ),
    );
  }
}
