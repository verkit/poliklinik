import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/screens/about.dart';
import 'package:poli_app/screens/home/doctor/profile.dart';
import 'package:poli_app/screens/home/home.dart';
import 'package:poli_app/strings.dart';

class MainController extends GetxController {
  //* Bottom Navigation Controll
  RxInt selectedIndex = 0.obs;
  void onItemTapped(int index) {
    if (index == 2) {
      if (Get.put<AuthController>(AuthController()).user.value == null) {
        Get.toNamed(MyRouter.login);
      } else {
        selectedIndex.value = index;
      }
    } else {
      selectedIndex.value = index;
    }
  }

  List<Widget> widgets = <Widget>[
    HomeScreen(),
    AboutScreen(),
    ProfileScreen(),
  ];

  //* Carousel slider
  RxList<String> _image = [
    'assets/balung1.jpg',
    'assets/balung.jpeg',
  ].obs;
  RxList<String> get image => _image;

  //* Select Doctor
  Rx<DoctorModel> selectedDoctor = DoctorModel().obs;
  detailDoctor(int index) {
    selectedDoctor.value = doctors[index];
    Get.toNamed(MyRouter.detailDoctor);
  }
}
