import 'package:flutter/material.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';
import 'package:flutter_instagram/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class SingleGridPost extends StatefulWidget {
  final PostResponse? post;

  const SingleGridPost({Key? key, this.post}) : super(key: key);

  @override
  State<SingleGridPost> createState() => _SingleGridPostState();
}

class _SingleGridPostState extends State<SingleGridPost> {
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
    return InkWell(
      splashColor: const Color(0xFFFD8D32),
      onTap: () {},
      child: widget.post!.scaledFileUrl
                  .substring(widget.post!.scaledFileUrl.lastIndexOf(".") + 1) ==
              "mp4"
          ? VideoPlayerWidget(
              controller: _videoController,
            )
          : Image.network(widget.post!.scaledFileUrl, fit: BoxFit.cover),
    );
  }
}
