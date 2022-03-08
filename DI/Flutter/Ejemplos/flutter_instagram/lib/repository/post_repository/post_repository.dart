import 'package:flutter_instagram/models/create_post_dto.dart';
import 'package:flutter_instagram/models/create_post_response.dart';
import 'package:flutter_instagram/models/post_response.dart';

abstract class PostRepository {
  Future<List<PostResponse>> fetchPosts(String type);
  Future<List<PostResponse>> fetchPostsByUser(String username);
  Future<CreatePostResponse> createPost(
      CreatePostDto createPostDto, String imagePath);
}
