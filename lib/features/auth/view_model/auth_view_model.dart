import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool showPassword        = false;
  bool showConfirmPassword = false;
  bool isEnglish           = true;
  bool isLoading           = false;
  int  selectedAvatar      = 1;
  String? errorMessage;

  void togglePassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  void toggleLanguage() {
    isEnglish = !isEnglish;
    notifyListeners();
  }

  void pickAvatar(int index) {
    selectedAvatar = index;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    errorMessage = null;

    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'Please fill all fields';
      notifyListeners();
      return false;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> register(String name, String email, String password,
      String confirmPassword, String phone) async {
    errorMessage = null;

    if (password != confirmPassword) {
      errorMessage = 'Passwords do not match';
      notifyListeners();
      return false;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> verifyEmail(String email) async {
    errorMessage = null;

    if (email.isEmpty) {
      errorMessage = 'Please enter your email';
      notifyListeners();
      return false;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();
    return true;
  }
}