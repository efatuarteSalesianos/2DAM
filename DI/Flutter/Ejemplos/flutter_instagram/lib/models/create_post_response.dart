class CreatePostResponse {
  CreatePostResponse(
      {required this.id,
      required this.title,
      required this.description,
      required this.privatePost,
      required this.scaledFileUrl,
      required this.likes,
      required this.liked,
      required this.userId,
      required this.username,
      required this.originalFileUrl});
  late final int id;
  late final String title;
  late final String description;
  late final bool privatePost;
  late final String scaledFileUrl;
  late final int likes;
  late final bool liked;
  late final int userId;
  late final String username;
  late final String originalFileUrl;

  CreatePostResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    privatePost = json['privatePost'];
    scaledFileUrl = json['scaledFileUrl'];
    likes = json['likes'];
    liked = json['liked'];
    userId = json['userId'];
    username = json['username'];
    originalFileUrl = json['originalFileUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['privatePost'] = privatePost;
    _data['scaledFileUrl'] = scaledFileUrl;
    _data['likes'] = likes;
    _data['liked'] = liked;
    _data['userId'] = userId;
    _data['username'] = username;
    _data['originalFileUrl'] = originalFileUrl;
    return _data;
  }
}
