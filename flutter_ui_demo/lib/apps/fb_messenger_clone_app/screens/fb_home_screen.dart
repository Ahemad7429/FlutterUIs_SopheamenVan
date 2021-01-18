import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/fb_messenger_clone_app/constant/data.dart';
import 'package:flutter_ui_demo/apps/fb_messenger_clone_app/screens/fb_chat_detail_screen.dart';
import 'package:flutter_ui_demo/apps/fb_messenger_clone_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class FBHomeScreen extends StatefulWidget {
  @override
  _FBHomeScreenState createState() => _FBHomeScreenState();
}

class _FBHomeScreenState extends State<FBHomeScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        children: [
          _buildNavBar(),
          SizedBox(height: 10),
          _buildSearchField(),
          SizedBox(height: 30),
          _buildStoriesView(),
          SizedBox(height: 30),
          Column(
            children: List.generate(
              userMessages.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FBChatDetailScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        child: Stack(
                          children: [
                            userMessages[index]['story']
                                ? Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 3,
                                        color: blue_story,
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 72,
                                        height: 72,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                userMessages[index]['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            userMessages[index]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            if (userMessages[index]['online'])
                              Positioned(
                                bottom: 8,
                                left: 55,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: online,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: white,
                                      width: 3.0,
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userMessages[index]['name'],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 140,
                            child: Text(
                              userMessages[index]['message'] +
                                  ' - ' +
                                  userMessages[index]['created_at'],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStoriesView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: grey),
                  child: Center(
                    child: Icon(
                      LineIcons.plus,
                      size: 33,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 75,
                  child: Align(
                      child: Text(
                    'Your Story',
                    overflow: TextOverflow.ellipsis,
                  )),
                )
              ],
            ),
          ),
          Row(
            children: List.generate(
              userStories.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      child: Stack(
                        children: [
                          userStories[index]['story']
                              ? Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 3,
                                      color: blue_story,
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      width: 72,
                                      height: 72,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              userStories[index]['img']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          userStories[index]['img']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                          if (userStories[index]['online'])
                            Positioned(
                              bottom: 8,
                              left: 55,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: online,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(userStories[index]['name'])
                  ],
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://filmdaily.co/wp-content/uploads/2019/12/arrow-lede-1300x733.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Chats',
          style: TextStyle(
            color: black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.edit),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _searchController,
        cursorColor: black,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Icon(
            LineIcons.search,
            color: black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
