import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/strings.dart';

class AboutScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang RSD Balung'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          Text(
            'Deskripsi',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/profil rumah sakitt.jpg',
                  height: 48,
                  width: 48,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    profileRs,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Anda dapat menghubungi kami melalui kontak dibawah ini',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/kontak/alamat.jpg',
                  height: 48,
                  width: 48,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        address,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipOval(
                  child: Image.asset(
                    'assets/kontak/informasi.jpg',
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        phone,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipOval(
                  child: Image.asset(
                    'assets/kontak/informasi pelayanan.jpg',
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Pelayanan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
