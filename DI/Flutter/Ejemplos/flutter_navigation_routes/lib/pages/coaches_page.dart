import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/models/coaches_response.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'NBA API',
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
      home: const CoachesPage(),
    );
  }
}

class CoachesPage extends StatefulWidget {
  const CoachesPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CoachesPage> {
  late Future<List<Standard>> coaches;

  @override
  void initState() {
    coaches = fetchCoaches();
    super.initState();
  }

  Future<List<Standard>> fetchCoaches() async {
    final response = await http.get(
        Uri.parse('http://data.nba.net/data/10s/prod/v1/2021/coaches.json'));
    if (response.statusCode == 200) {
      return CoachesResponse.fromJson(jsonDecode(response.body))
          .league
          .standard;
    } else {
      throw Exception('Failed to load NBA Coaches');
    }
  }

  Widget _coachesList(List<Standard> coachesList) {
    return SizedBox(
      height: 600.0,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        scrollDirection: Axis.vertical,
        itemCount: coachesList.length,
        itemBuilder: (context, index) {
          return _teamItem(coachesList.elementAt(index));
        },
      ),
    );
  }

  Widget _teamItem(Standard coach) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
            ),
            Text(
              coach.firstName + " " + coach.lastName,
              style: GoogleFonts.oswald(
                  textStyle: Theme.of(context).textTheme.headline6!,
                  color: const Color(0xFF333333)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: (Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF000000),
              title: Text(
                'Entrenadores Temporada 20/21',
                style: GoogleFonts.oswald(
                    textStyle: headline5, color: const Color(0xFFFFE81F)),
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
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 0),
                        child: FutureBuilder<List<Standard>>(
                            future: coaches,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return _coachesList(snapshot.data!);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return const CircularProgressIndicator(
                                color: Color(0xFFC9082A),
                              );
                            }),
                      ),
                    ],
                  ),
                ])))),
      ),
    );
  }
}
