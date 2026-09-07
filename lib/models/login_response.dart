// Model classes for the M-Pesa login API response.

class UserModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final double balance;
  final String currency;

  const UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.balance,
    required this.currency,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      balance: (json['balance'] as num).toDouble(),
      currency: json['currency'] as String,
    );
  }

  /// Returns the user's initials (up to 2 chars) for the avatar.
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  /// Formatted balance string, e.g. "ETB 1,250.50"
  String get formattedBalance {
    final formatted = balance.toStringAsFixed(2).replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (m) => ',',
        );
    return '$currency $formatted';
  }
}

class LoginResponse {
  final bool success;
  final String message;
  final UserModel user;
  final String token;
  final int expiresIn;

  const LoginResponse({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
    required this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return LoginResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      user: UserModel.fromJson(data['user'] as Map<String, dynamic>),
      token: data['token'] as String,
      expiresIn: data['expiresIn'] as int,
    );
  }
}
