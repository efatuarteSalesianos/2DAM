class StoryResponse {
  final String name;
  final String profilePic;

  StoryResponse(this.name, this.profilePic);

  factory StoryResponse.fromJson(Map<String, dynamic> json) {
    return StoryResponse(
      json['name'],
      json['profilePic'],
    );
  }
}
