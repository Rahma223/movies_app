import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends ChangeNotifier {

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool isEnglish = true;
  bool isLoading = false;

  int selectedAvatar = 1;

  String? errorMessage;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


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
      errorMessage = "Please fill all fields";
      notifyListeners();
      return false;
    }

    try {

      isLoading = true;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      isLoading = false;
      notifyListeners();

      return true;

    } on FirebaseAuthException catch (e) {

      switch (e.code) {

        case 'user-not-found':
          errorMessage = "No user found with this email";
          break;

        case 'wrong-password':
          errorMessage = "Incorrect password";
          break;

        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;

        case 'user-disabled':
          errorMessage = "This account has been disabled";
          break;

        default:
          errorMessage = "Login failed. Please try again";
      }

      isLoading = false;
      notifyListeners();

      return false;
    }
  }


  Future<bool> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone) async {

    errorMessage = null;

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      errorMessage = "Please fill all fields";
      notifyListeners();
      return false;
    }

    if (password != confirmPassword) {
      errorMessage = "Passwords do not match";
      notifyListeners();
      return false;
    }

    try {

      isLoading = true;
      notifyListeners();

      UserCredential credential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(name);

      isLoading = false;
      notifyListeners();

      return true;

    } on FirebaseAuthException catch (e) {

      switch (e.code) {

        case 'email-already-in-use':
          errorMessage = "This email is already registered";
          break;

        case 'weak-password':
          errorMessage = "Password must be at least 6 characters";
          break;

        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;

        default:
          errorMessage = "Registration failed";
      }

      isLoading = false;
      notifyListeners();

      return false;
    }
  }

  Future<bool> verifyEmail(String email) async {

    errorMessage = null;

    if (email.isEmpty) {
      errorMessage = "Please enter your email";
      notifyListeners();
      return false;
    }

    try {

      isLoading = true;
      notifyListeners();

      await _auth.sendPasswordResetEmail(email: email);

      isLoading = false;
      notifyListeners();

      return true;

    } on FirebaseAuthException catch (e) {

      switch (e.code) {

        case 'user-not-found':
          errorMessage = "No account found with this email";
          break;

        case 'invalid-email':
          errorMessage = "Invalid email address";
          break;

        default:
          errorMessage = "Failed to send reset email";
      }

      isLoading = false;
      notifyListeners();

      return false;
    }
  }


  Future<bool> signInWithGoogle() async {

    errorMessage = null;

    try {

      isLoading = true;
      notifyListeners();

      final GoogleSignInAccount? googleUser =
      await _googleSignIn.signIn();

      if (googleUser == null) {
        isLoading = false;
        notifyListeners();
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      isLoading = false;
      notifyListeners();

      return true;

    } catch (e) {

      errorMessage = "Google sign in failed. Please try again";

      isLoading = false;
      notifyListeners();

      return false;
    }
  }


  Future<void> logout() async {

    await _googleSignIn.signOut();
    await _auth.signOut();

  }

}