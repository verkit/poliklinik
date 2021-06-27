import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poli_app/strings.dart';

class ClinicScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poliklinik'),
      ),
      body: ListView.builder(
        itemCount: poliklinik.length,
        itemBuilder: (_, i) {
          return Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            poliklinik[i].gambar!,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(poliklinik[i].nama!)
                      ],
                    ),
                  ),
                  Container(color: Colors.grey[300], height: 1),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
