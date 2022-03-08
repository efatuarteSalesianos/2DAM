import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_app/models/movie_detail_response.dart';
import 'package:intl/intl.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _MovieDetailState createState() => _MovieDetailState(id: this.id);
}

class _MovieDetailState extends State<MovieDetailPage> {
  _MovieDetailState({required this.id});
  late int id;
  late Future<MovieDetailResponse> movie;

  @override
  void initState() {
    movie = fetchMovieDetail();
    super.initState();
  }

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  String getYear(String date) {
    return date.split('-')[0];
  }

  Future<MovieDetailResponse> fetchMovieDetail() async {
    const String tmdbApi = "05f2acc6fc39fbfdad7e530e9bf5b94a";
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=$tmdbApi&language=es-ES'));
    if (response.statusCode == 200) {
      return MovieDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Widget _movieDetailItem(MovieDetailResponse movie) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: FadeInImage(
                      width: 200,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movie.backdropPath}'),
                      placeholder:
                          const AssetImage('assets/images/loading.gif'),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/default.jpg',
                            fit: BoxFit.fitWidth);
                      },
                      fit: BoxFit.fitWidth,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Text(movie.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B2737),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(movie.voteAverage.toString(),
                                  style: const TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 30,
                                    color: Color(0xFF6F7D85),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Image.asset(
                                  'assets/images/star-icon.png',
                                  width: 13,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Image.asset(
                                  'assets/images/star-icon.png',
                                  width: 13,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Image.asset(
                                  'assets/images/star-icon.png',
                                  width: 13,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Image.asset(
                                  'assets/images/star-icon.png',
                                  width: 13,
                                ),
                              ),
                              Image.asset(
                                'assets/images/star-icon.png',
                                width: 13,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Length',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF889191),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(formatTime(movie.runtime * 60),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0B2737),
                                        )),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Language',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF889191),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(movie.originalLanguage,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0B2737),
                                        )),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Year',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF889191),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(getYear(movie.releaseDate),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0B2737),
                                        )),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Rating',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF889191),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text("+" + movie.runtime.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: "OpenSans",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF0B2737),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Storyline',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0B2737),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(movie.overview,
                                    style: const TextStyle(
                                      fontFamily: "OpenSans",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF889191),
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
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/detail_back.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FutureBuilder<MovieDetailResponse>(
                future: movie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _movieDetailItem(snapshot.data!);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                })),
        floatingActionButton: FloatingActionButton(
          elevation: 15,
          backgroundColor: const Color(0xFFFD9529),
          splashColor: const Color(0xFFFD9529),
          onPressed: () {},
          child: const Icon(
            Icons.play_circle_filled_outlined,
            size: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: Color(0xFF6D67FF),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Color(0xFF6D67FF),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.star_border_outlined,
                  color: Color(0xFF6D67FF),
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF6D67FF),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
