import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/router.dart';

class ProfileScreen extends GetView<AuthController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 96,
                height: 96,
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/dokter cowok.jpg',
                    ),
                  ),
                ),
              ),
              Text(controller.user.value!.phoneNumber!),
              if (controller.user.value!.displayName == '') ...[
                SizedBox(height: 2),
                Text(
                  controller.user.value!.displayName!,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
              SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  Get.toNamed(MyRouter.editProfile);
                },
                child: Text('Edit profil'),
              ),
              // SizedBox(height: 8),
              Container(color: Colors.grey[300], height: 1),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(MyRouter.history);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Row(
                        children: [
                          Icon(Icons.history),
                          SizedBox(width: 12),
                          Text('Riwayat Pasien'),
                        ],
                      ),
                    ),
                  ),
                  Container(color: Colors.grey[300], height: 1),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
