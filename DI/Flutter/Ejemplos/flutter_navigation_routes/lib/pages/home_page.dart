import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/pages/coaches_page.dart';
import 'package:flutter_navigation_routes/pages/players_page.dart';
import 'package:flutter_navigation_routes/pages/teams_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'NBA API';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const PlayersPage(),
    const TeamsPage(),
    const CoachesPage(),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Players',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Teams',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Coaches',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
