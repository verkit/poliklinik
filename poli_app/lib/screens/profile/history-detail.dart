import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/controllers/history.dart';

class HistoryDetailScreen extends GetView<HistoryController> {
  const HistoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pendaftaran'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          controller.selectedCheck.pasien!.jenisKelamin == "Pria"
                              ? 'assets/dokter cowok.jpg'
                              : 'assets/dokter cewek.jpg',
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.selectedCheck.pasien!.nama!),
                      SizedBox(height: 2),
                      Text(
                        controller.selectedCheck.pasien!.umur! + ' tahun',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Dokter',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Text(
                controller.selectedCheck.dokter!.nama!,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                controller.selectedCheck.dokter!.dokter!,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Tanggal Daftar',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Text(
                controller.selectedCheck.tanggalDaftar!,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Tanggal Pelayanan',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Text(
                controller.selectedCheck.tanggalPeriksa!,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  'Pembayaran',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Text(
                controller.selectedCheck.pembayaran!,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        'Antrian',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      controller.selectedCheck.antrian!.toString(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
