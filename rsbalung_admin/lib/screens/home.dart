import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/controllers/waiting.dart';
import 'package:rsbalung_admin/screens/report.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WaitingController _controller = Get.put<WaitingController>(WaitingController(FirestoreService()));
  RefreshController refreshController = RefreshController(initialRefresh: false);

  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _controller.checks.clear();
    _controller.getChecks();

    refreshController.refreshCompleted();
    setState(() {});
  }

  checkedWaitingList() async {
    if (_controller.role == 'pendaftaran') {
      _controller.selectedCheck!.selesai = true;
    } else {
      _controller.selectedCheck!.selesai_poli = true;
    }
    _controller.repository.updateCheck(_controller.selectedCheck!);
    Get.back();
    onRefresh();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => ReportScreen());
            },
            icon: Icon(Icons.print),
          )
        ],
      ),
      body: GetBuilder<WaitingController>(
        init: _controller,
        builder: (_) {
          return _controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SmartRefresher(
                  controller: refreshController,
                  onRefresh: onRefresh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0) - EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Antrian hari ini',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('Antrian'),
                                      Text(
                                        _controller.waitingNumber!.toString(),
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 18),
                                  Column(
                                    children: [
                                      Text('Kuota'),
                                      Text(
                                        _controller.kuota.toString(),
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        _controller.checks.isEmpty
                            ? SizedBox(
                                height: Get.height * 0.7,
                                child: Center(
                                  child: Text('Tidak ada antrian hari ini'),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: _controller.checks.length,
                                itemBuilder: (ctx, i) {
                                  var check = _controller.checks[i];
                                  return InkWell(
                                    onTap: () => _controller.getDetail(i),
                                    child: Container(
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
                                              check.pasien!.jenisKelamin == "L"
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
                                                check.pasien!.nama!,
                                                maxLines: 1,
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                check.dokter!.nama!,
                                                maxLines: 1,
                                                style: TextStyle(fontSize: 12),
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
                                                  // Icon(
                                                  //   Icons.calendar_today,
                                                  //   size: 12,
                                                  // ),
                                                  // SizedBox(width: 4),
                                                  // Text(
                                                  //   check.tanggalPeriksa!,
                                                  //   style: TextStyle(fontSize: 12),
                                                  // ),
                                                  // SizedBox(width: 8),
                                                  Text(
                                                    "Antrian :",
                                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    _controller.role == 'pendaftaran'
                                                        ? check.antrian!.toString()
                                                        : check.antrian_poli!.toString(),
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                check.selesai_poli!
                                                    ? 'Pemeriksaan selesai'
                                                    : 'Belum melakukan pemeriksaan',
                                                style: TextStyle(
                                                  color: check.selesai_poli! ? Colors.green : Colors.red,
                                                ),
                                              ),
                                              // SizedBox(height: 8),
                                              // Text(
                                              //   check.selesai! ? 'Selesai' : 'Belum periksa',
                                              //   style: TextStyle(color: check.selesai! ? Colors.green : Colors.red),
                                              // )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
