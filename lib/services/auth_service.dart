import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/login_response.dart';

/// Low-level HTTP service. Responsible only for making the request
/// and returning parsed data or throwing typed exceptions.
class AuthService {
  static const _baseUrl =
      'https://api.mockfly.dev/mocks/5064738f-5131-4b0a-8909-ca1634e26c27';

  Future<LoginResponse> login(String pin) async {
    final uri = Uri.parse('$_baseUrl/login');

    final http.Response response;
    try {
      response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'pin': pin}),
          )
          .timeout(const Duration(seconds: 15));
    } on SocketException {
      throw const AuthException('No internet connection. Please check your network.');
    } on HttpException {
      throw const AuthException('Network error. Please try again.');
    } on Exception {
      throw const AuthException('An unexpected error occurred. Please try again.');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200 && body['success'] == true) {
      return LoginResponse.fromJson(body);
    }

    // API returned an error body (e.g. 404 USER_NOT_FOUND)
    final message = body['message'] as String? ?? 'Login failed. Please try again.';
    throw AuthException(message);
  }
}

/// Typed exception for auth errors — carries a user-facing message.
class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}
