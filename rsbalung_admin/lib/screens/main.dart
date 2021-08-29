import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/main.dart';

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
              icon: Icon(Icons.person),
              label: 'Pasien',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Dokter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: 'Poliklinik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Tentang RS',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
