import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/main.dart';

class DetailDoctorScreen extends GetView<MainController> {
  const DetailDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.selectedDoctor.value.nama!),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 96,
                height: 96,
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      controller.selectedDoctor.value.jenisKelamin == "L"
                          ? 'assets/dokter cowok.jpg'
                          : 'assets/dokter cewek.jpg',
                    ),
                  ),
                ),
              ),
              Text(controller.selectedDoctor.value.nama!),
              SizedBox(height: 2),
              Text(
                controller.selectedDoctor.value.dokter!,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 8),
              Text(
                'Jadwal Praktek',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                itemCount: controller.selectedDoctor.value.jadwal!.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.selectedDoctor.value.jadwal![i].hari!),
                        Text(
                            "${controller.selectedDoctor.value.jadwal![i].pukul!.buka!} s/d ${controller.selectedDoctor.value.jadwal![i].pukul!.tutup!}"),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
