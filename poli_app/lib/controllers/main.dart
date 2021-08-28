import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/models/doctor/doctor_model.dart';
import 'package:poli_app/models/polyclinic/polyclinic_model.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/screens/about.dart';
import 'package:poli_app/screens/home/doctor/profile.dart';
import 'package:poli_app/screens/home/home.dart';
import 'package:poli_app/services/firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  bool isLoading = false;

  //* Select Doctor
  List<DoctorModel> doctors = [];
  Rx<DoctorModel> selectedDoctor = DoctorModel().obs;
  detailDoctor(int index) {
    selectedDoctor.value = doctors[index];
    Get.toNamed(MyRouter.detailDoctor);
  }

  RefreshController refreshDoctor = RefreshController(initialRefresh: false);
  void onRefreshDoctor() async {
    doctors.clear();
    doctors = await FirestoreService.getDoctors();
    update();
    refreshDoctor.refreshCompleted();
  }

  Future getDoctors() async {
    isLoading = true;
    update();
    doctors = await FirestoreService.getDoctors();
    isLoading = false;
    print(doctors);
    update();
  }

  List<PolyclinicModel> polyclinics = <PolyclinicModel>[];

  Future getPolyclinics() async {
    isLoading = true;
    update();
    polyclinics = await FirestoreService.getPolyclinics();
    isLoading = false;
    update();
  }

  RefreshController refreshPoli = RefreshController(initialRefresh: false);
  onRefreshPoli() async {
    polyclinics.clear();
    polyclinics = await FirestoreService.getPolyclinics();
    refreshPoli.refreshCompleted();
    update();
  }

  @override
  void onInit() {
    getDoctors();
    super.onInit();
  }
}
