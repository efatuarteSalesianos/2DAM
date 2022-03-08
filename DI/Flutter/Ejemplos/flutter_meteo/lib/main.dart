import 'package:flutter/material.dart';
import 'package:flutter_meteo/pages/bottom_nav.dart';
import 'package:flutter_meteo/pages/mars_page.dart';
import 'package:flutter_meteo/pages/set_city_page.dart';
import 'package:flutter_meteo/pages/home_page.dart';
import 'package:flutter_meteo/pages/landing_page.dart';
import 'package:flutter_meteo/utils/shared_preferences.dart';

void main() {
  runApp(const MeteoApp());
  PreferenceUtils.init();
}

class MeteoApp extends StatelessWidget {
  const MeteoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/nav': (context) => const BottomNav(),
        '/home': (context) => const HomePage(),
        '/search': (context) => const SetCityPage(),
        '/mars': (context) => const MarsPage(),
      },
    );
  }
}
