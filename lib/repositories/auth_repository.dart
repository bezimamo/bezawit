import '../models/login_response.dart';
import '../services/auth_service.dart';

/// In-memory token store. Fine for a small exam project.
/// In production you'd use flutter_secure_storage.
String? _accessToken;

String? get accessToken => _accessToken;

/// Repository layer. Validates input, delegates to [AuthService],
/// and persists the token on success.
class AuthRepository {
  final AuthService _service;

  AuthRepository({AuthService? service}) : _service = service ?? AuthService();

  /// Validates [pin] then calls the login API.
  /// Throws [AuthException] on validation failure or API error.
  Future<LoginResponse> login(String pin) async {
    if (pin.isEmpty) {
      throw const AuthException('Please enter your PIN.');
    }
    if (pin.length != 4) {
      throw const AuthException('PIN must be 4 digits.');
    }
    if (!RegExp(r'^\d{4}$').hasMatch(pin)) {
      throw const AuthException('PIN must contain digits only.');
    }

    final response = await _service.login(pin);

    // Store token in memory after successful login
    _accessToken = response.token;

    return response;
  }
}
