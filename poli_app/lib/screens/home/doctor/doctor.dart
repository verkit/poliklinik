import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DoctorScreen extends GetView<MainController> {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dokter'),
      ),
      body: GetBuilder<MainController>(
          init: controller,
          builder: (_) {
            return SmartRefresher(
              controller: controller.refreshDoctor,
              onRefresh: controller.onRefreshDoctor,
              child: ListView.builder(
                itemCount: controller.doctors.length,
                itemBuilder: (_, i) {
                  return InkWell(
                    onTap: () => controller.detailDoctor(i),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  controller.doctors[i].jenisKelamin == "L"
                                      ? 'assets/dokter cowok.jpg'
                                      : 'assets/dokter cewek.jpg',
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.doctors[i].nama!,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    controller.doctors[i].dokter!,
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                    maxLines: 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(color: Colors.grey[300], height: 1),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
