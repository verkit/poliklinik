import 'package:get/instance_manager.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/controllers/check.dart';
import 'package:poli_app/controllers/history.dart';
import 'package:poli_app/controllers/main.dart';
import 'package:poli_app/controllers/profile.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}

class CheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CheckController>(CheckController());
  }
}

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
  }
}

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HistoryController>(HistoryController());
  }
}
