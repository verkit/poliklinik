import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rsbalung_admin/bindings.dart';
import 'package:rsbalung_admin/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EasyLoading.instance
    ..dismissOnTap = false
    ..maskType = EasyLoadingMaskType.black;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'RSD Balung Jember',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 14),
        ),
      ),
      getPages: MyRouter.pages,
      initialRoute: MyRouter.splash,
      initialBinding: MainBinding(),
    );
  }
}
