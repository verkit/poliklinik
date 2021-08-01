import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rsbalung_admin/services/auth.dart';

class AuthController extends GetxController {
  //* Login
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rxn<User> user = Rxn<User>();

  Stream<User?> authStateChanges = FirebaseAuth.instance.authStateChanges();

  void login() async {
    AuthFirebase.signin(email.text, password.text).whenComplete(() {
      email.clear();
      password.clear();
    });
    update();
  }

  signOut() {
    AuthFirebase.signOut();
    update();
  }
}
