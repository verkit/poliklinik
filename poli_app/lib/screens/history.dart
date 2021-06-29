import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/history.dart';
import 'package:poli_app/models/check/check_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryController controller = HistoryController();

  @override
  void initState() {
    controller = Get.put<HistoryController>(HistoryController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Pasien'),
      ),
      body: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () async {
                    await controller.loadHistory().then((value) => controller.refreshController.refreshCompleted());
                  },
                  child: controller.histories.isEmpty
                      ? Center(
                          child: Text('Anda belum pernah melakukan pemeriksaan'),
                        )
                      : ListView.builder(
                          itemCount: controller.histories.length,
                          itemBuilder: (_, i) {
                            CheckModel check = controller.histories[i];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey[350]!, width: 1),
                                ),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.asset(
                                      check.dokter!.jenisKelamin == "L"
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
                                        check.dokter!.nama!,
                                        maxLines: 1,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        check.dokter!.dokter!,
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 12, color: Colors.grey),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 12,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            check.tanggalPeriksa!,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "Antrian :",
                                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            check.antrian!.toString(),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                );
        },
      ),
    );
  }
}
