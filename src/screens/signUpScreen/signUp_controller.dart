import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    print('Email: $email, Password: $password'); // Log email and password
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
