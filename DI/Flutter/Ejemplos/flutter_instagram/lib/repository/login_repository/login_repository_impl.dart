import 'dart:convert';
import 'package:flutter_instagram/models/login_dto.dart';
import 'package:flutter_instagram/models/login_response.dart';
import 'package:flutter_instagram/repository/login_repository/login_repository.dart';
import 'package:http/http.dart';
import '../constants.dart';

class LoginRepositoryImpl extends LoginRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final response = await _client.post(
        Uri.parse('${Constant.apiBaseUrl}/auth/login'),
        body: jsonEncode(loginDto.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }
}
