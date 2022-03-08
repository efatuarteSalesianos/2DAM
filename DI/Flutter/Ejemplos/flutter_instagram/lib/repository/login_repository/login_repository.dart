import 'package:flutter_instagram/models/login_dto.dart';
import 'package:flutter_instagram/models/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> login(LoginDto loginDto);
}
