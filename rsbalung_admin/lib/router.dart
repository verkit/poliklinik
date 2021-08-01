import 'package:get/route_manager.dart';
import 'package:rsbalung_admin/screens/check_detail.dart';
import 'package:rsbalung_admin/screens/form/doctor.dart';
import 'package:rsbalung_admin/screens/form/polyclinic.dart';
import 'package:rsbalung_admin/screens/home.dart';
import 'package:rsbalung_admin/screens/login.dart';
import 'package:rsbalung_admin/screens/main.dart';
import 'package:rsbalung_admin/screens/splash.dart';

import 'bindings.dart';

class MyRouter {
  static String formDoctor = '/form/doctor';
  static String formPoliclinic = '/form/poli';
  static String login = '/login';
  static String main = '/main';
  static String splash = '/splash';
  static String home = '/home';
  static String checkDetail = '/check-detail';

  static final pages = [
    GetPage(name: formDoctor, page: () => FormDoctorScreen(), binding: DoctorBinding()),
    GetPage(name: formPoliclinic, page: () => FormPolyclinicScreen(), binding: PolyBinding()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: main, page: () => MainScreen()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: checkDetail, page: () => CheckDetailScreen()),
  ];
}
