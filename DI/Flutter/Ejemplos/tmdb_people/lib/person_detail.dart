import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/person_detail_response.dart';

class PersonDetailPage extends StatefulWidget {
  const PersonDetailPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  _PersonDetailState createState() => _PersonDetailState(id: this.id);
}

class _PersonDetailState extends State<PersonDetailPage> {
  _PersonDetailState({required this.id});
  late int id;
  late Future<PersonDetailResponse> person;

  @override
  void initState() {
    person = fetchPersonDetail();
    super.initState();
  }

  Future<PersonDetailResponse> fetchPersonDetail() async {
    const String tmdbApi = "05f2acc6fc39fbfdad7e530e9bf5b94a";
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/$id?api_key=$tmdbApi&language=es-ES'));
    if (response.statusCode == 200) {
      return PersonDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  Widget _personDetailItem(PersonDetailResponse person) {
    return Stack(children: [
      Image.network(
        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2${person.profilePath}',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Positioned(
        top: 70,
        left: 20,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder<PersonDetailResponse>(
              future: person,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _personDetailItem(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}
