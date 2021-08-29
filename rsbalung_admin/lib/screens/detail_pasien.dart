import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/pasien.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class DetailPasienScreen extends StatelessWidget {
  const DetailPasienScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasienController _controller = Get.put<PasienController>(PasienController(FirestoreService()));
    return GetBuilder<PasienController>(
        init: _controller,
        builder: (controller) {
          var pasien = controller.patiens[controller.indexPatient!];
          return Scaffold(
            appBar: AppBar(
              title: Text('Detail Pasien'),
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
                            pasien.jenisKelamin == "L" ? 'assets/dokter cowok.jpg' : 'assets/dokter cewek.jpg',
                          ),
                        ),
                      ),
                    ),
                    Text(pasien.nama!),
                    SizedBox(height: 2),
                    Text(
                      pasien.noTelp!,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Container(color: Colors.grey[300], height: 1),
                    SizedBox(height: 8),
                    Text(
                      'Riwayat Pasien',
                    ),
                    SizedBox(height: 8),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.patientHistories.length,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(MyRouter.history);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.patientHistories[i].dokter!.nama!),
                                          SizedBox(height: 2),
                                          Text(
                                            controller.patientHistories[i].dokter!.poliklinik!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            'Tanggal periksa : ' + controller.patientHistories[i].tanggalPeriksa!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(color: Colors.grey[300], height: 1)
                            ],
                          );
                        })
                  ],
                ),
              ],
            ),
          );
        });
  }
}
