import 'package:flutter/material.dart';
import 'auth_service.dart';

class LoginProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    bool success = await _authService.login(email, password);

    _isLoading = false;
    notifyListeners();

    return success;
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }
}
