import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_instagram/models/story_response.dart';

void main() {
  runApp(const MaterialApp(
    home: StoriesScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  List<dynamic> stories = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/stories.json');
    final data = await json.decode(response);

    setState(() {
      stories =
          data['stories'].map((data) => StoryResponse.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return Container(
              padding: const EdgeInsets.only(left: 13),
              child: storyItem(stories[index]));
        },
      ),
    );
  }

  Widget storyItem(StoryResponse story) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF9E2692),
                  Color(0xFFFD8D32),
                ],
              ),
              shape: BoxShape.circle),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(story.profilePic)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            story.name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
