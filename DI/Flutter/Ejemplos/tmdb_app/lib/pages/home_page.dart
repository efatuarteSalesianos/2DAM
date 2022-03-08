import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_app/models/movie_response.dart';
import 'package:tmdb_app/pages/movie_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late Future<List<Movie>> movies;

  @override
  void initState() {
    movies = fetchMovie();
    super.initState();
  }

  Future<List<Movie>> fetchMovie() async {
    const String tmdbApi = "05f2acc6fc39fbfdad7e530e9bf5b94a";
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$tmdbApi&language=es-ES'));
    if (response.statusCode == 200) {
      return MovieResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Widget _popularMoviesList(List<Movie> popularMoviesList) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularMoviesList.length,
        itemBuilder: (context, index) {
          return _movieItem(popularMoviesList.elementAt(index));
        },
      ),
    );
  }

  Widget _movieItem(Movie movie) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MovieDetailPage(id: movie.id),
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
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: GestureDetector(
              onTap: () => {Navigator.of(context).push(_createRoute())},
              child: FadeInImage(
                width: 135,
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movie.backdropPath}'),
                placeholder: const AssetImage('assets/images/loading.gif'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/default.jpg',
                      fit: BoxFit.fitWidth);
                },
                fit: BoxFit.fitWidth,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 19,
                      color: Color(0xFF2A2A2A),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/star-icon.png',
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(movie.voteAverage.toString(),
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 16,
                              color: Color(0xFF2A2A2A),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://library.kissclipart.com/20180929/ooq/kissclipart-avatar-person-clipart-avatar-computer-icons-person-87355c56a1748473.jpg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Ernesto Fatuarte',
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 22,
                            color: Color(0xFF2A2A2A),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Icon(
                          Icons.connected_tv,
                          color: Color(0xFF6D67FF),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 35),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        'Movies, Series, TV Shows...',
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 36,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 300,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F5FA),
                            border: Border.all(
                                color: const Color(0xFF6D67FF), width: 1.0),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon:
                                  Icon(Icons.search, color: Color(0xFF6D67FF)),
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.equalizer,
                            color: Color(0xFF6D67FF),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 22,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 330,
                          child: FutureBuilder<List<Movie>>(
                              future: movies,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return _popularMoviesList(snapshot.data!);
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
            ),
          ],
        ),
      ),
    );
  }
}
