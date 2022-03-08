import 'package:flutter/material.dart';
import 'package:tmdb_app/pages/download_movies.dart';
import 'package:tmdb_app/pages/favorite_movies.dart';
import 'package:tmdb_app/pages/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoriteMoviesPage(),
    DownloadMoviesPage(),
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.downloading),
            label: 'Dowloads',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF6D67FF),
        onTap: _onItemTapped,
      ),
    );
  }
}
