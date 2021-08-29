import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/controllers/pasien.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class PasienScreen extends StatefulWidget {
  const PasienScreen({Key? key}) : super(key: key);

  @override
  _PasienScreenState createState() => _PasienScreenState();
}

class _PasienScreenState extends State<PasienScreen> {
  PasienController _controller = Get.put<PasienController>(PasienController(FirestoreService()));
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasienController>(
        init: _controller,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Daftar Pasien'),
              ),
              body: SmartRefresher(
                controller: _controller.refreshController,
                onRefresh: _controller.onRefresh,
                child: _controller.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _controller.patiens.isEmpty
                        ? Center(
                            child: Text('Belum ada pasien'),
                          )
                        : ListView.builder(
                            itemCount: _controller.patiens.length,
                            itemBuilder: (_, i) {
                              return InkWell(
                                onTap: () => _controller.gotoDetail(i),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(24),
                                            child: Image.asset(
                                              _controller.patiens[i].jenisKelamin == "L"
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
                                                _controller.patiens[i].nama!,
                                                maxLines: 1,
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                _controller.patiens[i].alamat! +
                                                    ', ' +
                                                    _controller.patiens[i].kelurahan! +
                                                    ', ' +
                                                    _controller.patiens[i].kecamatan! +
                                                    ', ' +
                                                    _controller.patiens[i].kabupaten!,
                                                style: TextStyle(fontSize: 13, color: Colors.grey),
                                                maxLines: 2,
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
              ));
        });
  }
}
