import 'package:flutter/material.dart';
import 'package:flutter_instagram/widgets/grid_posts_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _MyShopScreenState createState() => _MyShopScreenState();
}

class _MyShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 0, length: 4, vsync: this);
    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListView(children: [
                  TabBar(
                    indicatorColor: const Color(0xFF262626),
                    controller: _controller,
                    tabs: [
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/images/icon/grid.svg',
                          color:
                              selectedIndex == 0 ? Colors.black : Colors.grey,
                          width: 18,
                          semanticsLabel: 'My Posts',
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/images/icon/reels.svg',
                          color:
                              selectedIndex == 1 ? Colors.black : Colors.grey,
                          width: 20,
                          semanticsLabel: 'My Reels',
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/images/icon/play.svg',
                          color:
                              selectedIndex == 2 ? Colors.black : Colors.grey,
                          width: 18,
                          semanticsLabel: 'Lives',
                        ),
                      ),
                      Tab(
                        icon: SvgPicture.asset(
                          'assets/images/icon/tag.svg',
                          color:
                              selectedIndex == 3 ? Colors.black : Colors.grey,
                          width: 20,
                          semanticsLabel: 'Tagged Posts',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      controller: _controller,
                      children: [
                        ListView(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: const CardGridPost()),
                          ],
                        ),
                        ListView(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: const CardGridPost()),
                          ],
                        ),
                        ListView(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: const CardGridPost()),
                          ],
                        ),
                        ListView(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: const CardGridPost()),
                          ],
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}
