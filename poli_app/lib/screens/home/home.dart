import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/auth.dart';
import 'package:poli_app/controllers/main.dart';
import 'package:poli_app/router.dart';
import 'package:poli_app/services/auth.dart';

class HomeScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: Get.height * 0.3,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            items: controller.image.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(i), fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    controller.getDoctors();
                    Get.toNamed(MyRouter.doctor);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipOval(
                      child: Image.asset(
                        'assets/jadwal dokter.jpg',
                        height: 48,
                        width: 48,
                      ),
                    ),
                    title: Text(
                      'Jadwal Dokter',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Container(color: Colors.grey[300], height: 1),
                InkWell(
                  onTap: () {
                    Get.put<AuthController>(AuthController()).user.value != null
                        ? Get.offNamed(MyRouter.check)
                        : Get.toNamed(MyRouter.login);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/pendaftaran.png',
                          height: 32,
                          width: 32,
                        ),
                      ),
                    ),
                    title: Text(
                      'Pendaftaran',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Container(color: Colors.grey[300], height: 1),
                InkWell(
                  onTap: () {
                    controller.getPolyclinics();
                    Get.toNamed(MyRouter.polyclinic);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: ClipOval(
                      child: Image.asset(
                        'assets/poliklinik.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                    title: Text(
                      'Poliklinik',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Container(color: Colors.grey[300], height: 1),
                if (Get.put<AuthController>(AuthController()).user.value != null) ...[
                  InkWell(
                    onTap: () => AuthFirebase.signOut(),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.logout),
                      ),
                      title: Text(
                        'Keluar',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
