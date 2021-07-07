import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/controllers/main.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: controller.widgets.elementAt(controller.selectedIndex.value),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Tentang RS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Get.find<AuthController>().user.value == null ? 'Login' : 'Profil',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }
}
