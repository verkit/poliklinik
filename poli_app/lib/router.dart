import 'package:get/route_manager.dart';
import 'package:poli_app/bindings.dart';
import 'package:poli_app/screens/home/check.dart';
import 'package:poli_app/screens/home/clinic.dart';
import 'package:poli_app/screens/home/doctor/detail.dart';
import 'package:poli_app/screens/home/doctor/doctor.dart';
import 'package:poli_app/screens/login.dart';
import 'package:poli_app/screens/main.dart';
import 'package:poli_app/screens/profile/form-profile.dart';
import 'package:poli_app/screens/profile/history-detail.dart';
import 'package:poli_app/screens/profile/history.dart';
import 'package:poli_app/screens/splash.dart';

class MyRouter {
  static String main = '/main';
  static String polyclinic = '/clinic';
  static String doctor = '/doctor';
  static String detailDoctor = '/doctor/detail';
  static String check = '/check';
  static String login = '/login';
  static String splash = '/splash';
  static String history = '/history';
  static String detailHistory = '/history/detail';
  static String editProfile = '/edit/profile';

  static final pages = [
    GetPage(name: main, page: () => MainScreen()),
    GetPage(name: polyclinic, page: () => ClinicScreen()),
    GetPage(name: doctor, page: () => DoctorScreen()),
    GetPage(name: detailDoctor, page: () => DetailDoctorScreen()),
    GetPage(name: check, page: () => CheckScreen(), binding: CheckBinding()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: history, page: () => HistoryScreen(), binding: HistoryBinding()),
    GetPage(name: detailHistory, page: () => HistoryDetailScreen(), binding: HistoryBinding()),
    GetPage(name: editProfile, page: () => FormProfileScreen(), binding: ProfileBinding()),
  ];
}
