class CreatePostDto {
  String? title;
  String? description;
  bool? privatePost;

  CreatePostDto({this.title, this.description, this.privatePost});

  CreatePostDto.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    privatePost = json['privatePost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['public'] = privatePost;
    return data;
  }
}
