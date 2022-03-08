import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/pages/coaches_page.dart';
import 'package:flutter_navigation_routes/pages/home_page.dart';
import 'package:flutter_navigation_routes/pages/players_page.dart';
import 'package:flutter_navigation_routes/pages/teams_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyStatefulWidget(),
        '/players': (context) => const PlayersPage(),
        '/teams': (context) => const TeamsPage(),
        '/coaches': (context) => const CoachesPage(),
      },
    );
  }
}
