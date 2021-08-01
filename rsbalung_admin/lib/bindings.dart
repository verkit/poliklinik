import 'package:get/instance_manager.dart';
import 'package:rsbalung_admin/controllers/auth.dart';
import 'package:rsbalung_admin/controllers/doctor.dart';
import 'package:rsbalung_admin/controllers/main.dart';
import 'package:rsbalung_admin/controllers/polyclinic.dart';
import 'package:rsbalung_admin/controllers/waiting.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => WaitingController(FirestoreService()), fenix: true);
  }
}

class DoctorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorController>(() => DoctorController(FirestoreService()));
  }
}

class PolyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolyController>(() => PolyController(FirestoreService()));
  }
}
