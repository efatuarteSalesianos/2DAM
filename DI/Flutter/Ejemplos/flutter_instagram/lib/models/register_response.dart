class RegisterResponse {
  RegisterResponse({
    required this.username,
    required this.email,
    required this.privateAccount,
    required this.avatar,
    required this.birthDate,
    required this.rol,
    required this.followers,
  });
  late final String username;
  late final String email;
  late final bool privateAccount;
  late final String avatar;
  late final DateTime birthDate;
  late final String rol;
  late final int followers;

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    privateAccount = json['privateAccount'];
    avatar = json['avatar'];
    birthDate = json['birthDate'];
    rol = json['rol'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['privateAccount'] = privateAccount;
    _data['avatar'] = avatar;
    _data['birthDate'] = birthDate;
    _data['rol'] = rol;
    _data['followers'] = followers;
    return _data;
  }
}
