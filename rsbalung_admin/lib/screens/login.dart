import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/auth.dart';
import 'package:rsbalung_admin/snackbar.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
                        controller: controller.password,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintStyle: TextStyle(fontSize: 14), hintText: 'Password'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.email.text.isEmpty || controller.password.text.isEmpty) {
                          Snackbar.info('Harap isi semua isian');
                        } else {
                          controller.login();
                        }
                      },
                      child: Text('Masuk'),
                      style: ElevatedButton.styleFrom(minimumSize: Size(Get.width, 40)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
