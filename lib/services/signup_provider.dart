import 'package:flutter/material.dart';
import 'auth_service.dart';

class SignUpProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<bool> signUp(String email, String username, String password) async {
    _isLoading = true;
    notifyListeners();

    bool success = await _authService.signUp(email, username, password);

    _isLoading = false;
    notifyListeners();

    return success;
  }
}
