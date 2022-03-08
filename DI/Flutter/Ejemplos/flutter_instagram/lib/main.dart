import 'package:flutter/material.dart';
import 'package:flutter_instagram/ui/home_screen.dart';
import 'package:flutter_instagram/ui/landing_screen.dart';
import 'package:flutter_instagram/ui/login_screen.dart';
import 'package:flutter_instagram/ui/menu_screen.dart';
import 'package:flutter_instagram/ui/notifications_screen.dart';
import 'package:flutter_instagram/ui/register_screen.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';

void main() {
  PreferenceUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miarmagram',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}
