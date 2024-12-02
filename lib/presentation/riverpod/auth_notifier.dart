import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  final String? email;
  final String? password;
  final bool isAuthenticated;

  AuthState({
    this.email,
    this.password,
    this.isAuthenticated = true,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  final Map<String, String> _validCredentials = {
    'test@example.com': 'Password@123',
    'user1@example.com': 'User@123',
    'user2@example.com': 'User@456',
  };

  bool validateCredentials(String email, String password) {
    return _validCredentials[email] == password;
  }

  void authenticate(String email, String password) {
    if (validateCredentials(email, password)) {
      state =
          AuthState(email: email, password: password, isAuthenticated: true);
    } else {
      state = AuthState();
    }
  }

  void logout() {
    state = AuthState();
  }
}
