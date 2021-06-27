import 'package:get/instance_manager.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/controllers/main.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
