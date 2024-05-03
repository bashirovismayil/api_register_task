import 'package:api_login/auth.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AuthRepository implements AuthContract {
  final Dio dio;
  final String baseUrl;

  AuthRepository({required this.dio, required this.baseUrl});

  @override
  Future<Map<String, String>> register(String email, String password) async {
    final response = await dio.post(
      '$baseUrl/accounts/register/',
      data: jsonEncode({'email': email, 'password': password}),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 201) {
      final data = response.data;
      final accessToken = data['tokens']['access'];
      final refreshToken = data['tokens']['refresh'];

      return {'access': accessToken, 'refresh': refreshToken};
    } else {
      throw Exception('error code: ${response.statusCode}');
    }
  }
}
