import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_routes/models/player_response.dart';
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
      home: const PlayersPage(),
    );
  }
}

class PlayersPage extends StatefulWidget {
  const PlayersPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PlayersPage> {
  late Future<List<Standard>> players;

  @override
  void initState() {
    players = fetchPlayers();
    super.initState();
  }

  Future<List<Standard>> fetchPlayers() async {
    final response = await http.get(
        Uri.parse('http://data.nba.net/data/10s/prod/v1/2021/players.json'));
    if (response.statusCode == 200) {
      return PlayerResponse.fromJson(jsonDecode(response.body)).league.standard;
    } else {
      throw Exception('Failed to load NBA players');
    }
  }

  Widget _playersList(List<Standard> playersList) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 250.0,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // vertical spacing between the items
          mainAxisSpacing: 5, // horizontal spacing between the items
          crossAxisSpacing: 5, // number of items in your list
        ),
        scrollDirection: Axis.vertical,
        itemCount: playersList.length,
        itemBuilder: (context, index) {
          return _playersItem(playersList.elementAt(index));
        },
      ),
    );
  }

  Widget _playersItem(Standard player) {
    return Container(
      width: 300.0,
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
                    'https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/${player.personId}.png'),
                placeholder: const AssetImage(''),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('', fit: BoxFit.fitWidth);
                },
                fit: BoxFit.fitWidth,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
            ),
            Text(
              "player.firstName + " " + player.lastName",
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
    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    return MaterialApp(
      home: DefaultTabController(
        length: 1,
        child: (Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF000000),
              title: Text(
                'Jugadores Temporada 20/21',
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
                            future: players,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return _playersList(snapshot.data!);
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
