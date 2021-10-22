import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/controllers/doctor.dart';
import 'package:rsbalung_admin/services/firestore.dart';

import 'form/doctor.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  DoctorController _controller = Get.put<DoctorController>(DoctorController(FirestoreService()));
  final FirestoreService repository = FirestoreService();
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _controller.doctors.clear();
    _controller.doctors = await _controller.getDoctors();

    refreshController.refreshCompleted();
    setState(() {});
  }

  deleteDoctor(int i) {
    repository.deleteDoctor(_controller.doctors[i].id!);
    onRefresh();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorController>(
        init: _controller,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Dokter'),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () => Get.to(() => FormDoctorScreen(isEdit: false))!.then((value) {
                  if (value == true) {
                    onRefresh();
                  }
                }),
                child: Icon(Icons.add),
              ),
              body: SmartRefresher(
                controller: refreshController,
                onRefresh: onRefresh,
                child: _controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _controller.doctors.isEmpty
                        ? Center(
                            child: Text('Belum ada dokter'),
                          )
                        : ListView.builder(
                            itemCount: _controller.doctors.length,
                            itemBuilder: (_, i) {
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (DismissDirection direction) {
                                  deleteDoctor(i);
                                },
                                background: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  color: Colors.red,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () =>
                                      Get.to(() => FormDoctorScreen(isEdit: true, data: _controller.doctors[i]))!
                                          .then((value) {
                                    if (value == true) {
                                      onRefresh();
                                    }
                                  }),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(24),
                                              child: Image.asset(
                                                _controller.doctors[i].jenisKelamin == "L"
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
                                                  _controller.doctors[i].nama!,
                                                  maxLines: 1,
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  _controller.doctors[i].dokter!,
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
                                ),
                              );
                            },
                          ),
              ));
        });
  }
}
