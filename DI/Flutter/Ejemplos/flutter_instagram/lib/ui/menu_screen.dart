import 'package:flutter/material.dart';
import 'package:flutter_instagram/ui/home_screen.dart';
import 'package:flutter_instagram/ui/profile_screen.dart';
import 'package:flutter_instagram/ui/reels_screen.dart';
import 'package:flutter_instagram/ui/search_screen.dart';
import 'package:flutter_instagram/ui/shop_screen.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MenuWidget());
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavBar',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFFFFF),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  final String? token;
  final String? username;
  const MenuScreen({Key? key, this.token, this.username}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const ShopScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    ));
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? SvgPicture.asset('assets/images/icon/home_filled.svg',
                    width: 23, semanticsLabel: 'Home Filled')
                : SvgPicture.asset(
                    'assets/images/icon/home.svg',
                    width: 23,
                    semanticsLabel: 'Home',
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? SvgPicture.asset(
                    'assets/images/icon/search.svg',
                    width: 23,
                    semanticsLabel: 'Search',
                    color: Colors.black,
                  )
                : SvgPicture.asset(
                    'assets/images/icon/search.svg',
                    width: 23,
                    semanticsLabel: 'Search',
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? SvgPicture.asset(
                    'assets/images/icon/reels.svg',
                    width: 23,
                    semanticsLabel: 'Reels',
                    color: Colors.black,
                  )
                : SvgPicture.asset(
                    'assets/images/icon/reels.svg',
                    width: 23,
                    semanticsLabel: 'Reels',
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? SvgPicture.asset(
                    'assets/images/icon/shop.svg',
                    width: 23,
                    semanticsLabel: 'Shop',
                    color: Colors.black,
                  )
                : SvgPicture.asset(
                    'assets/images/icon/shop.svg',
                    width: 23,
                    semanticsLabel: 'Shop',
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 31.0,
                      backgroundImage: widget.username == 'efatuarte'
                          ? const AssetImage("assets/images/profile.jpg")
                          : const AssetImage(
                              "assets/images/default_avatar.png"),
                      backgroundColor: Colors.transparent,
                    ),
                  )
                : CircleAvatar(
                    radius: 31.0,
                    backgroundImage: widget.username == 'efatuarte'
                        ? const AssetImage("assets/images/profile.jpg")
                        : const AssetImage("assets/images/default_avatar.png"),
                    backgroundColor: Colors.transparent,
                  ),
          ),
        ],
      ),
    );
  }
}
