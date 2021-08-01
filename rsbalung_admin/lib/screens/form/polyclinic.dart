import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsbalung_admin/controllers/polyclinic.dart';
import 'package:rsbalung_admin/validator.dart';

class FormPolyclinicScreen extends GetView<PolyController> {
  const FormPolyclinicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: controller.onBack, icon: Icon(Icons.arrow_back)),
        title: Text(!controller.isEdit ? 'Tambah Poli' : 'Ubah Poli'),
        actions: [
          IconButton(
            onPressed: () {
              !controller.isEdit ? controller.createPoli() : controller.updatePoli();
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: GetBuilder<PolyController>(
        init: controller,
        builder: (_) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            controller.image != null
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: ExtendedImage.file(
                                        File(controller.image!.path),
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                  )
                                : controller.selectedPoli == null
                                    ? SizedBox()
                                    : controller.selectedPoli!.gambar == null
                                        ? SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(24),
                                              child: ExtendedImage.network(
                                                controller.selectedPoli!.gambar!,
                                                width: 48,
                                                height: 48,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                            Expanded(
                              child: TextFormField(
                                controller: controller.klinik,
                                validator: (val) => Validation.required(val!),
                                decoration: InputDecoration(labelText: 'Nama'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            controller.getImage();
                          },
                          child: Text(controller.isEdit ? 'Ubah gambar' : 'Tambah gambar'),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
