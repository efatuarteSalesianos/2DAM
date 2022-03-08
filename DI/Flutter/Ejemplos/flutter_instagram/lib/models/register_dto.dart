class RegisterDto {
  RegisterDto(
      {required this.username,
      required this.email,
      required this.birthDate,
      required this.privateAccount,
      required this.password,
      required this.password2});
  late final String username;
  late final String email;
  late final String birthDate;
  late final bool privateAccount;
  late final String password;
  late final String password2;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['birthDate'] = birthDate;
    _data['privateAccount'] = privateAccount;
    _data['password'] = password;
    _data['password2'] = password2;
    return _data;
  }
}
