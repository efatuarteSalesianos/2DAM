import 'dart:convert';
import 'package:flutter_instagram/models/create_post_response.dart';
import 'package:flutter_instagram/models/create_post_dto.dart';
import 'package:flutter_instagram/models/post_response.dart';
import 'package:flutter_instagram/repository/post_repository/post_repository.dart';
import 'package:flutter_instagram/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../constants.dart';

class PostRepositoryImpl extends PostRepository {
  final PreferenceUtils preferenceUtils = PreferenceUtils();

  @override
  Future<List<PostResponse>> fetchPosts(String type) async {
    String token = PreferenceUtils.getString('TOKEN')!;

    final response = await http
        .get(Uri.parse('${Constant.apiBaseUrl}/post/public'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return (jsonResponse as List)
          .map((post) => PostResponse.fromJson(post))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<PostResponse>> fetchPostsByUser(String username) async {
    String token = PreferenceUtils.getString('TOKEN')!;
    final response = await http
        .get(Uri.parse('${Constant.apiBaseUrl}/post/$username'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return (jsonResponse as List)
          .map((post) => PostResponse.fromJson(post))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<CreatePostResponse> createPost(
      CreatePostDto createPostDto, String imagePath) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    var uri = Uri.parse('${Constant.apiBaseUrl}/post/');

    var body = jsonEncode({
      'titulo': createPostDto.title,
      'contenido': createPostDto.description,
      'privateAccount': createPostDto.privatePost
    });

    var request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('newPost', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('file', imagePath,
          contentType: MediaType('image', 'jpg')))
      ..headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 201) {
      return CreatePostResponse.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
