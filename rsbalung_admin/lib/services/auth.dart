import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/auth.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/snackbar.dart';

class AuthFirebase {
  static Future signin(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      EasyLoading.show();
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        if (value.user != null) {
          Get.find<AuthController>().user.value = value.user;
          Get.put<AuthController>(AuthController()).authStateChanges.listen((User? user) {
            if (user != null) {
              print('User is signed in!');
              Get.offAllNamed(MyRouter.main);
            }
          });
        }
      });
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  static Future checkCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      var user = await _auth.currentUser;
      if (user != null) {
        Get.put<AuthController>(AuthController()).user.value = user;
        await Get.offAllNamed(MyRouter.main);
      } else {
        Get.offAllNamed(MyRouter.login);
      }
    } on FirebaseAuthException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future signOut() async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.signOut().then((value) {
        Get.put<AuthController>(AuthController()).authStateChanges;
        Get.offAllNamed(MyRouter.login);
      });
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
