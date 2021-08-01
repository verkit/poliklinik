import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rsbalung_admin/controllers/polyclinic.dart';
import 'package:rsbalung_admin/services/firestore.dart';

class PolyclinicScreen extends StatefulWidget {
  const PolyclinicScreen({Key? key}) : super(key: key);

  @override
  _PolyclinicScreenState createState() => _PolyclinicScreenState();
}

class _PolyclinicScreenState extends State<PolyclinicScreen> {
  PolyController _controller = Get.put<PolyController>(PolyController(FirestoreService()));
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PolyController>(
      init: _controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Poliklinik'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _controller.gotoForm,
            backgroundColor: Colors.black,
            child: Icon(Icons.add),
          ),
          body: _controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.polyclinics.isEmpty
                  ? Center(
                      child: Text('Belum ada poli'),
                    )
                  : SmartRefresher(
                      controller: _controller.refreshController,
                      onRefresh: _controller.onRefresh,
                      child: ListView.builder(
                        itemCount: _controller.polyclinics.length,
                        itemBuilder: (_, i) {
                          return Dismissible(
                            key: Key(_controller.polyclinics[i].nama!),
                            onDismissed: (DismissDirection direction) {
                              _controller.onDeletePoli(i);
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
                              onTap: () => _controller.gotoForm(data: _controller.polyclinics[i]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: ExtendedImage.network(
                                            _controller.polyclinics[i].gambar!,
                                            width: 48,
                                            height: 48,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(_controller.polyclinics[i].nama!)
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
                    ),
        );
      },
    );
  }
}
