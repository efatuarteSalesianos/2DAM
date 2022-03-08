import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_people/person_detail.dart';
import '../models/person_popular_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TMDB API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String getName(String name) {
    return name.split(' ')[0];
  }

  String getSurname(String name) {
    return name.split(' ')[1];
  }

  late Future<List<Person>> people;

  @override
  void initState() {
    people = fetchPeople();
    super.initState();
  }

  Future<List<Person>> fetchPeople() async {
    const String tmdbApi = "05f2acc6fc39fbfdad7e530e9bf5b94a";
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/popular?api_key=$tmdbApi&language=es-ES'));
    if (response.statusCode == 200) {
      return PersonPopularResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load people');
    }
  }

  Widget _popularPeopleResponseList(List<Person> peoplePopularList) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peoplePopularList.length,
        itemBuilder: (context, index) {
          return _personItem(peoplePopularList.elementAt(index));
        },
      ),
    );
  }

  Widget _personItem(Person person) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            PersonDetailPage(id: person.id),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0, 2000.0);
          const end = Offset.infinite;
          const curve = Curves.easeOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonDetailPage(
                            id: person.id,
                          )),
                ),
                child: Image.network(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${person.profilePath}',
                  fit: BoxFit.cover,
                  height: 360,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              elevation: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getName(person.name),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 30,
                      color: Color(0xFF2A2A2A),
                    )),
                Text(getSurname(person.name),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 20,
                      color: Color(0xFFBABABA),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Best Actors and Actresses',
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 30,
                        color: Color(0xFF2A2A2A),
                      )),
                  SizedBox(
                    height: 600,
                    child: FutureBuilder<List<Person>>(
                        future: people,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _popularPeopleResponseList(snapshot.data!);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
