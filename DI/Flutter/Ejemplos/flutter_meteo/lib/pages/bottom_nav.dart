import 'package:flutter/material.dart';
import 'package:flutter_meteo/pages/mars_page.dart';
import 'package:flutter_meteo/pages/set_city_page.dart';
import 'package:flutter_meteo/pages/home_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MarsPage(),
    SetCityPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.homeOutline,
              size: 30,
            ),
            label: 'Tierra',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.rocketOutline,
              size: 30,
            ),
            label: 'Marte',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.place_outlined,
              size: 30,
            ),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
