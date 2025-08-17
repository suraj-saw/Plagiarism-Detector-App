import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/repository/exceptions/signup_email_password_failure.dart';
import 'package:plagiarism_app/src/screens/homeScreen/home_screen.dart';
import 'package:plagiarism_app/src/screens/welcomeScreen/welcome.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _setInitialScreen(_auth.currentUser);
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Welcome())
        : Get.offAll(() => const HomeScreen());
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    if (!_isValidEmail(email)) {
      print('Invalid email format.');
      throw const SignUpWithEmailAndPasswordFailure('Invalid email format.');
    }
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.to(() => const Welcome());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (e) {
      print('EXCEPTION - ${e.toString()}');
      throw const SignUpWithEmailAndPasswordFailure(
          'An unexpected error occurred. Please try again.');
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    if (!_isValidEmail(email)) {
      print('Invalid email format.');
      throw const SignUpWithEmailAndPasswordFailure('Invalid email format.');
    }
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (e) {
      print('EXCEPTION - ${e.toString()}');
      throw const SignUpWithEmailAndPasswordFailure(
          'An unexpected error occurred. Please try again.');
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
