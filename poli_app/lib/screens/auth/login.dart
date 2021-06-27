import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/snackbar.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
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
                    Text('Masukkan nomor hp anda sebelum melanjutkan'),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
                        controller: controller.hpForm,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '08123xxxx',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.hpForm.text.isEmpty) {
                          Snackbar.info('Harap masukkan nomor hp');
                        } else if (controller.hpForm.text.length < 11 || controller.hpForm.text.length > 13) {
                          Snackbar.info('Panjang nomor hp tidak valid');
                        } else {
                          controller.login(context, controller.hpForm.text);
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
