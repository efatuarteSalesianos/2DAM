import 'package:flutter/material.dart';
import 'package:flutter_instagram/ui/notifications_screen.dart';
import 'package:flutter_instagram/ui/upload_post_dart.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';
import 'package:flutter_instagram/widgets/post_widget.dart';
import 'package:flutter_instagram/widgets/stories_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PreferenceUtils.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SvgPicture.asset('assets/images/logo.svg',
                        width: 150, semanticsLabel: 'Instagram Logo'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset('assets/images/icon/add.svg',
                            width: 28, semanticsLabel: 'Add Post'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UploadPostScreen()),
                          );
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/images/icon/heart.svg',
                            width: 28, semanticsLabel: 'Notifications'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationsScreen()),
                          );
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/images/icon/share.svg',
                            width: 28, semanticsLabel: 'Messages'),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 110.0,
                  child: const StoriesScreen()),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const CardPost()),
            ],
          ),
        ),
      ],
    );
  }
}
