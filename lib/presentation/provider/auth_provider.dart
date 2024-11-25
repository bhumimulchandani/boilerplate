import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _email;
  String? _password;

  final Map<String, String> _validCredentials = {
    'test@example.com': 'Password@123',
    'user1@example.com': 'User@123',
    'user2@example.com': 'User@456',
  };

  String? get email => _email;
  String? get password => _password;

  bool get isAuthenticated => _email != null && _password != null;

  bool validateCredentials(String email, String password) {
    return _validCredentials[email] == password;
  }

  void authenticate(String email, String password) {
    if (validateCredentials(email, password)) {
      _email = email;
      _password = password;
      notifyListeners();
    }
  }

  void logout() {
    _email = null;
    _password = null;
    notifyListeners();
  }
}
