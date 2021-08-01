import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/controllers/doctor.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  DoctorController _controller = Get.put<DoctorController>(DoctorController(FirestoreService()));
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
                onPressed: _controller.gotoForm,
                child: Icon(Icons.add),
              ),
              body: SmartRefresher(
                controller: _controller.refreshController,
                onRefresh: _controller.onRefresh,
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
                                key: Key(_controller.doctors[i].nama!),
                                onDismissed: (DismissDirection direction) {
                                  _controller.deleteDoctor(i);
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
                                  onTap: () => _controller.gotoForm(data: _controller.doctors[i]),
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
