import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/screens/about.dart';
import 'package:rsbalung_admin/screens/doctor.dart';
import 'package:rsbalung_admin/screens/home.dart';
import 'package:rsbalung_admin/screens/polyclinic.dart';

class MainController extends GetxController {
  //* Bottom Navigation Controll
  RxInt selectedIndex = 0.obs;
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  //* Carousel slider
  RxList<String> _image = [
    'assets/balung1.jpg',
    'assets/balung.jpeg',
  ].obs;
  RxList<String> get image => _image;

  List<Widget> widgets = <Widget>[
    HomeScreen(),
    DoctorScreen(),
    PolyclinicScreen(),
    AboutScreen(),
  ];
}
