import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';
import 'package:flutter_instagram/widgets/video_player_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'dart:convert';

class SinglePost extends StatefulWidget {
  final PostResponse? post;

  const SinglePost({Key? key, this.post}) : super(key: key);

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
    _videoController = VideoPlayerController.network(widget.post!.scaledFileUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => _videoController.play());
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String decodeDescription = utf8
        .decode(latin1.encode(widget.post!.description), allowMalformed: true);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF9E2692),
                                    Color(0xFFFD8D32),
                                  ],
                                ),
                                shape: BoxShape.circle),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: InteractiveViewer(
                                      constrained: true,
                                      onInteractionEnd: _onInteractionEnd,
                                      child: widget.post?.username ==
                                              'efatuarte'
                                          ? Image.asset(
                                              "assets/images/profile.jpg")
                                          : Image.asset(
                                              "assets/images/default_avatar.png"))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              widget.post!.username,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        icon: SvgPicture.asset('assets/images/icon/more.svg',
                            width: 20, semanticsLabel: 'More'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              widget.post!.scaledFileUrl.substring(
                          widget.post!.scaledFileUrl.lastIndexOf(".") + 1) ==
                      "mp4"
                  ? VideoPlayerWidget(
                      controller: _videoController,
                    )
                  : Image.network(widget.post!.scaledFileUrl),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                                'assets/images/icon/heart.svg',
                                width: 25,
                                semanticsLabel: 'Like'),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                                'assets/images/icon/comment.svg',
                                width: 23,
                                semanticsLabel: 'Comment'),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                                'assets/images/icon/share.svg',
                                width: 25,
                                semanticsLabel: 'Share'),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                            'assets/images/icon/bookmark.svg',
                            width: 22,
                            semanticsLabel: 'Save'),
                        onPressed: () {},
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.post!.likes.toString() + ' Me gusta',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: widget.post!.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                )),
                            TextSpan(
                              text: ' ' + decodeDescription,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onInteractionEnd(ScaleEndDetails details) {}
}
