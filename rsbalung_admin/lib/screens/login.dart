import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/auth.dart';
import 'package:rsbalung_admin/router.dart';
import 'package:rsbalung_admin/services/auth.dart';

import '../snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: Get.put<AuthController>(AuthController()),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/logo.jpg', height: Get.width * 0.5),
                            SizedBox(height: 8),
                            Text(
                              'RSD Balung Jember',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 12),
                            Text('Silahkan login terlebih dahulu'),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(fontSize: 14),
                                ),
                                onChanged: (s) {
                                  controller.update();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: TextField(
                                controller: password,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 14),
                                  hintText: 'Password',
                                ),
                                onChanged: (s) {
                                  controller.update();
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // AuthFirebase().registrationBatch();
                                print(email.text.isEmpty);
                                if (email.text.isEmpty || password.text.isEmpty) {
                                  Snackbar.info('Harap isi semua isian');
                                } else {
                                  AuthFirebase.signin(email.text, password.text);
                                }
                              },
                              child: Text('Masuk'),
                              style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 40)),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offNamed(MyRouter.signup);
                              },
                              child: Text('Belum punya akun? Daftar'),
                              style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 40)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
