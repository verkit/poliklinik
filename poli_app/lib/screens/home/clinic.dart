import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ClinicScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poliklinik'),
      ),
      body: GetBuilder<MainController>(
          init: controller,
          builder: (_) {
            return SmartRefresher(
              controller: controller.refreshPoli,
              onRefresh: controller.onRefreshPoli,
              child: controller.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.polyclinics.isEmpty
                      ? Center(
                          child: Text('Data kosong'),
                        )
                      : ListView.builder(
                          itemCount: controller.polyclinics.length,
                          itemBuilder: (_, i) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: ExtendedImage.network(
                                          controller.polyclinics[i].gambar!,
                                          width: 48,
                                          height: 48,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Text(controller.polyclinics[i].nama!)
                                    ],
                                  ),
                                ),
                                Container(color: Colors.grey[300], height: 1),
                              ],
                            );
                          },
                        ),
            );
          }),
    );
  }
}
