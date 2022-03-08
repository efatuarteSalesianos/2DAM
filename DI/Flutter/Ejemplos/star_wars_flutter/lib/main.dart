import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_wars_flutter/models/people_response.dart';
import 'package:star_wars_flutter/models/planet_response.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars API',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late Future<List<People>> people;
  late Future<List<Planet>> planets;

  @override
  void initState() {
    people = fetchPeople();
    planets = fetchPlanets();
    super.initState();
  }

  Future<List<People>> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load Star Wars characters');
    }
  }

  Future<List<Planet>> fetchPlanets() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/planets'));
    if (response.statusCode == 200) {
      return PlanetResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load Star Wars planets');
    }
  }

  Widget _PeopleList(List<People> PeopleList) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: PeopleList.length,
        itemBuilder: (context, index) {
          return _PersonItem(PeopleList.elementAt(index));
        },
      ),
    );
  }

  Widget _planetList(List<Planet> planetList) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: planetList.length,
        itemBuilder: (context, index) {
          return _planetItem(planetList.elementAt(index));
        },
      ),
    );
  }

  Widget _PersonItem(People person) {
    var id = person.url.split("/");
    return Container(
      width: 158,
      color: const Color(0xFF000000),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: FadeInImage(
                image: NetworkImage(
                    'https://starwars-visualguide.com/assets/img/characters/${id[5]}.jpg'),
                placeholder:
                    const AssetImage('assets/images/imperial_emblem.gif'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/default.png',
                      fit: BoxFit.fitWidth);
                },
                fit: BoxFit.fitWidth,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
            ),
            Text(
              person.name,
              style: GoogleFonts.oswald(
                  textStyle: Theme.of(context).textTheme.headline6!,
                  color: const Color(0xFFFFE81F)),
            )
          ],
        ),
      ),
    );
  }

  Widget _planetItem(Planet planet) {
    var id = planet.url.split("/");
    return Container(
      width: 158,
      color: const Color(0xFF000000),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: FadeInImage(
                image: NetworkImage(
                    'https://starwars-visualguide.com/assets/img/planets/${id[5]}.jpg'),
                placeholder:
                    const AssetImage('assets/images/imperial_emblem.gif'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/tatooine.png',
                      fit: BoxFit.fitWidth);
                },
                fit: BoxFit.fitWidth,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
            ),
            Text(
              planet.name,
              style: GoogleFonts.oswald(
                  textStyle: Theme.of(context).textTheme.headline6!,
                  color: const Color(0xFFFFE81F)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline3 = Theme.of(context).textTheme.headline3!;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: (Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF000000),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person_outline)),
                  Tab(icon: Icon(Icons.place_outlined)),
                ],
              ),
              title: Text(
                'Star Wars API',
                style: GoogleFonts.oswald(
                    textStyle: headline3, color: const Color(0xFFFFE81F)),
              ),
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: TabBarView(children: [
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Personajes Principales',
                          style: GoogleFonts.oswald(
                              textStyle: Theme.of(context).textTheme.headline5!,
                              color: const Color(0xFFFFE81F)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        child: FutureBuilder<List<People>>(
                            future: people,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return _PeopleList(snapshot.data!);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return const CircularProgressIndicator();
                            }),
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Planetas',
                          style: GoogleFonts.oswald(
                              textStyle: Theme.of(context).textTheme.headline5!,
                              color: const Color(0xFFFFE81F)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: FutureBuilder<List<Planet>>(
                            future: planets,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return _planetList(snapshot.data!);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return const CircularProgressIndicator();
                            }),
                      ),
                    ],
                  ),
                ])))),
      ),
    );
  }
}
