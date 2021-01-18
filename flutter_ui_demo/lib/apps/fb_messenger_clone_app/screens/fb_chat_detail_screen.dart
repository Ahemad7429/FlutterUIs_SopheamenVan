import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/fb_messenger_clone_app/constant/data.dart';
import 'package:flutter_ui_demo/apps/fb_messenger_clone_app/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class FBChatDetailScreen extends StatefulWidget {
  @override
  _FBChatDetailScreenState createState() => _FBChatDetailScreenState();
}

class _FBChatDetailScreenState extends State<FBChatDetailScreen> {
  TextEditingController _sendMessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: grey.withOpacity(0.2),
      elevation: 0,
      leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: primary,
          )),
      title: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://filmdaily.co/wp-content/uploads/2019/12/arrow-lede-1300x733.jpg"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Oliver Queen",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: black),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "Active now",
                style: TextStyle(color: black.withOpacity(0.4), fontSize: 14),
              )
            ],
          )
        ],
      ),
      actions: <Widget>[
        Icon(
          LineIcons.phone,
          color: primary,
          size: 32,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          LineIcons.video_camera,
          color: primary,
          size: 35,
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
              color: online,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white38)),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  Widget getBottom() {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(color: grey.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 15,
          top: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width - 30) / 2,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_circle,
                    size: 38,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.camera_alt,
                    size: 38,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.photo,
                    size: 38,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.keyboard_voice,
                    size: 35,
                    color: primary,
                  ),
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 30) / 2,
              child: Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 140) / 2,
                    height: 40,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        cursorColor: black,
                        controller: _sendMessageController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",
                            suffixIcon: Icon(
                              Icons.face,
                              color: primary,
                              size: 38,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.thumb_up,
                    size: 38,
                    color: primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: List.generate(messages.length, (index) {
        return BubbleChat(
          isMe: messages[index]['isMe'],
          messageType: messages[index]['messageType'],
          message: messages[index]['message'],
          profileImage: messages[index]['profileImg'],
        );
      }),
    );
  }
}

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String profileImage;
  final String message;
  final int messageType;

  const BubbleChat({
    Key key,
    @required this.isMe,
    this.profileImage,
    this.message,
    this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isMe) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    profileImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: getMessageType(messageType),
                color: grey,
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: getMessageType(messageType),
                color: primary,
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 15, color: white),
              ),
            )
          ],
        ),
      );
    }
  }

  BorderRadius getMessageType(messageType) {
    if (isMe) {
      switch (messageType) {
        case 1:
          return BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          );
        case 2:
          return BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          );
        case 3:
          return BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          );
        default:
          return BorderRadius.all(Radius.circular(30));
      }
    } else {
      switch (messageType) {
        case 1:
          return BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          );
        case 2:
          return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          );

        case 3:
          return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          );
        default:
          return BorderRadius.all(Radius.circular(30));
      }
    }
  }
}
