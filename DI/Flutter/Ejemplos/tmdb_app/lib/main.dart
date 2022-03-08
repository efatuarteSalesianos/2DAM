import 'package:flutter/material.dart';
import 'package:tmdb_app/pages/download_movies.dart';
import 'package:tmdb_app/pages/favorite_movies.dart';
import 'package:tmdb_app/pages/home_page.dart';
import 'package:tmdb_app/pages/navigation_page.dart';
import 'package:tmdb_app/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/main': (context) => const NavigationPage(),
        '/home': (context) => const HomePage(),
        '/favorites': (context) => const FavoriteMoviesPage(),
        '/download': (context) => const DownloadMoviesPage(),
        '/movie-detail': (context) => const DownloadMoviesPage(),
      },
    );
  }
}
