import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/snackbar.dart';

class AuthFirebase {
  static Future signin(AuthCredential credential) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      EasyLoading.show();
      UserCredential _userCredential = await _auth.signInWithCredential(credential);
      if (_userCredential.user != null) {
        Get.back();
        Get.find<AuthController>().user.value = _userCredential.user;
        Get.offAllNamed(MyRouter.main);
      }
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  static Future verification(String verificationId, String code) async {
    EasyLoading.show();
    AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code);
    signin(credential).whenComplete(() => EasyLoading.dismiss());
  }

  static Future checkCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      var user = await _auth.currentUser;
      if (user != null) {
        Get.put<AuthController>(AuthController()).user.value = user;
      } else {
        await Get.toNamed(MyRouter.main);
      }
    } on FirebaseAuthException catch (e) {
      Snackbar.error(e.message);
    }
  }

  static Future signOut() async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.signOut().then((value) {
        Get.put<AuthController>(AuthController()).authStateChanges.listen((User? user) {
          if (user == null) {
            print('User is currently signed out!');
            Get.put<AuthController>(AuthController()).user.value = user;
            Get.offAllNamed(MyRouter.main);
          } else {
            print('User is signed in!');
          }
        });
      });
    } on FirebaseException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }
}
