import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:poli_app/services/auth.dart';
import 'package:poli_app/snackbar.dart';

class AuthController extends GetxController {
  //* Login
  TextEditingController hpForm = TextEditingController();
  Rxn<User> user = Rxn<User>();

  Stream<User?> authStateChanges = FirebaseAuth.instance.authStateChanges();

  void login(BuildContext context, String phoneNumber) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    RegExp regex = RegExp(r"^(^08)(\d{3,4}-?){2}\d{3,4}$");
    if (regex.hasMatch(phoneNumber)) {
      var _phone = phoneNumber.replaceFirst(RegExp(r"0"), '+62');
      try {
        EasyLoading.show();
        await _auth.verifyPhoneNumber(
          phoneNumber: _phone,
          timeout: Duration(seconds: 60),
          verificationCompleted: (credential) async {
            AuthFirebase.signin(credential);
          },
          verificationFailed: (e) {
            Snackbar.error(e.message);
          },
          codeSent: (verificationId, token) {
            TextEditingController _codeController = TextEditingController();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Masukkan kode"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Konfirmasi"),
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthFirebase.verification(verificationId, code);
                      },
                    )
                  ],
                );
              },
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      Snackbar.info('Nomor telepon tidak valid');
    }
    print(regex.hasMatch(phoneNumber));
  }

  signOut() {
    AuthFirebase.signOut();
    update();
  }
}
