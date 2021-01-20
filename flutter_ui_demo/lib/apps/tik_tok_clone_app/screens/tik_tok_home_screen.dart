import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/constant/data_json.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/theme/colors.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/widgets/header_home.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/widgets/icon_widgets.dart';
import 'package:flutter_ui_demo/apps/tik_tok_clone_app/widgets/tik_tok_icons.dart';
import 'package:video_player/video_player.dart';

class TikTokHomeScreen extends StatefulWidget {
  @override
  _TikTokHomeScreenState createState() => _TikTokHomeScreenState();
}

class _TikTokHomeScreenState extends State<TikTokHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
          controller: _tabController,
          children: List.generate(
            items.length,
            (index) => RotatedBox(
              quarterTurns: -1,
              child: VideoPlayerItem(
                size: size,
                name: items[index]['name'],
                caption: items[index]['caption'],
                songName: items[index]['songName'],
                profileImg: items[index]['profileImg'],
                likes: items[index]['likes'],
                comments: items[index]['comments'],
                shares: items[index]['shares'],
                albumImg: items[index]['albumImg'],
                videoUrl: items[index]['videoUrl'],
              ),
            ),
          )),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final Size size;

  VideoPlayerItem(
      {Key key,
      @required this.size,
      @required this.name,
      @required this.caption,
      @required this.songName,
      @required this.profileImg,
      @required this.likes,
      @required this.comments,
      @required this.shares,
      @required this.albumImg,
      this.videoUrl})
      : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  bool isShowPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {
          isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  Widget isPlaying() {
    return _videoPlayerController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: white.withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      child: Container(
        width: widget.size.width,
        height: widget.size.height,
        decoration: BoxDecoration(color: black),
        child: Stack(
          children: [
            Container(
              height: widget.size.height,
              width: widget.size.width,
              decoration: BoxDecoration(color: black),
              child: Stack(
                children: <Widget>[
                  VideoPlayer(_videoPlayerController),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: isPlaying(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: widget.size.width,
              height: widget.size.height,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, left: 15, bottom: 10, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderHomePage(),
                      Flexible(
                        child: Row(
                          children: [
                            LeftPanel(
                              size: widget.size,
                              name: widget.name,
                              caption: widget.caption,
                              songName: widget.songName,
                            ),
                            RightPanel(
                              size: widget.size,
                              likes: widget.likes,
                              comments: widget.comments,
                              shares: widget.shares,
                              profileImg: widget.profileImg,
                              albumImg: widget.albumImg,
                            )
                          ],
                        ),
                      )
                    ],
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

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;
  final Size size;
  const RightPanel({
    Key key,
    @required this.size,
    this.likes,
    this.comments,
    this.shares,
    this.profileImg,
    this.albumImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getProfile(profileImg),
                    getIcon(TikTokIcons.heart, 35.0, likes),
                    getIcon(TikTokIcons.chat_bubble, 35.0, comments),
                    getIcon(TikTokIcons.reply, 25.0, shares),
                    getAlbum(albumImg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  final Size size;
  const LeftPanel({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name,
            style: TextStyle(
              color: white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            caption,
            style: TextStyle(
              color: white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              Text(
                songName,
                style: TextStyle(
                  color: white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
