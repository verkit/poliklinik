import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/auth.dart';
import 'package:rsbalung_admin/models/account.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/snackbar.dart';
import 'package:rsbalung_admin/strings.dart';

class AuthFirebase {
  static Future signin(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      EasyLoading.show();
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        if (value.user != null) {
          Get.find<AuthController>().user.value = value.user;
          print(Get.find<AuthController>().user.value);
          Get.find<AuthController>().authStateChanges.listen((User? user) {
            if (user != null) {
              print('User is signed in!');
              Get.offAllNamed(MyRouter.main);
            }
          });
        }
      });
    } on FirebaseAuthException catch (e) {
      Snackbar.error(e.message);
    } finally {
      EasyLoading.dismiss();
    }
  }

  static Future signup({
    required String email,
    required String password,
    required String name,
    required String gender,
    required String address,
    required String phone,
    required String role,
  }) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      EasyLoading.show();
      var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      var firestore = FirebaseFirestore.instance;
      UserAccount userAccount = UserAccount(
        address: address,
        gender: gender,
        name: name,
        phone: phone,
        role: role,
        uid: user.user!.uid,
      );
      await firestore.collection('admins').doc(user.user!.uid).set(userAccount.toJson());
      Snackbar.success('Berhasil melakukan pendaftaran');
      Future.delayed(Duration(seconds: 1));
      Get.toNamed(MyRouter.login);
    } on FirebaseAuthException catch (e) {
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
        Get.offAllNamed(MyRouter.main);
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

  Future<void> registrationBatch() async {
    try {
      EasyLoading.show();
      for (var i = 0; i < poliklinik.length; i++) {
        // role
        // String poli = poliklinik[i].nama!.toLowerCase().replaceAll(' ', '');
        // daftar
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: "admin${i}@rsudbalung.com", password: "p4ssword")
            .then(
          (value) async {
            await FirebaseFirestore.instance.collection('admins').add(
              {'user_uid': value.user!.uid, 'role': poliklinik[i].nama},
            );
          },
        );
      }
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getRole() async {
    var user = FirebaseAuth.instance.currentUser;
    var snapshot = await FirebaseFirestore.instance
        .collection('admins')
        .where(
          'user_uid',
          isEqualTo: user!.uid,
        )
        .get();
    return snapshot.docs.first.get('role');
  }
}
